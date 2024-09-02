import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/helpers/ticker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_events.dart';
part 'timer_states.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {

  static const int duration = 60;
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker}) :
        _ticker = ticker,
        super(const TimerInitial(duration)) {
    on<TimeSheetStarted>(_onStarted);
    on<TimeSheetPaused>(_onPaused);
    on<TimeSheetResumed>(_onResumed);
    on<TimeSheetCompleted>(_onCompleted);
    on<TimeSheetTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimeSheetStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.duration));

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimeSheetTicked(duration: duration)));
  }

  void _onPaused(TimeSheetPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _onResumed(TimeSheetResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  void _onCompleted(TimeSheetCompleted event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(const TimerInitial(duration));
  }

  void _onTicked(TimeSheetTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete(),
    );
  }

}
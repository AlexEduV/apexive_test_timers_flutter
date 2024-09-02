part of 'timer_blocs.dart';

sealed class TimerState extends Equatable {

  final int duration;
  const TimerState(this.duration);

  @override
  List<Object?> get props => [duration];

}

final class TimerInitial extends TimerState {

  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial {duration: $duration}';

}

final class TimerRunPause extends TimerState {

  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause {duration: $duration}';

}

final class TimerRunInProgress extends TimerState {

  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress {duration: $duration}';

}

final class TimerRunComplete extends TimerState {

  const TimerRunComplete () : super(0);

}

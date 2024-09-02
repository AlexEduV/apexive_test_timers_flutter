import 'package:equatable/equatable.dart';

sealed class TimerState extends Equatable {

  final int duration;
  const TimerState({required this.duration});

  @override
  List<Object?> get props => [duration];

}


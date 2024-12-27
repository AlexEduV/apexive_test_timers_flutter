part of 'timer_blocs.dart';

sealed class TimerEvent {
  const TimerEvent();
}

final class TimeSheetStarted extends TimerEvent {
  final int duration;

  const TimeSheetStarted({required this.duration});

}

final class TimeSheetPaused extends TimerEvent {
  const TimeSheetPaused();
}

final class TimeSheetResumed extends TimerEvent {
  const TimeSheetResumed();
}

final class TimeSheetCompleted extends TimerEvent {
  const TimeSheetCompleted();
}

class TimeSheetTicked extends TimerEvent {
  final int duration;

  const TimeSheetTicked({required this.duration});
}
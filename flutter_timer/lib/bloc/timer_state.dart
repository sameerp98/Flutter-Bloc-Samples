part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration);
  @override
  String toString() => 'TimerInitial {duration: $duration}';
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int d) : super(d);

  @override
  String toString() => 'TimerRunInProgress {duration: $duration}';
}

class TimerRunPause extends TimerState {
  const TimerRunPause(int d) : super(d);

  @override
  String toString() => 'TimerRunPause {duration: $duration}';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}

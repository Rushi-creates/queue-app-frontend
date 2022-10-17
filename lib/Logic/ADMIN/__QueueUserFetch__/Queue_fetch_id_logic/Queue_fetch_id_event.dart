part of 'Queue_fetch_id_bloc.dart';

abstract class QueueFetchIdEvent extends Equatable {
  const QueueFetchIdEvent();

  @override
  List<Object> get props => [];
}

class Queue_FetchById_onButtonPressed_Event extends QueueFetchIdEvent {
  final id;

  Queue_FetchById_onButtonPressed_Event(this.id);
}

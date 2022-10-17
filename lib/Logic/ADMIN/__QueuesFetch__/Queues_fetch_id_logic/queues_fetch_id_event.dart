part of 'queues_fetch_id_bloc.dart';

abstract class QueuesFetchIdEvent extends Equatable {
  const QueuesFetchIdEvent();

  @override
  List<Object> get props => [];
}

class Queues_FetchById_onButtonPressed_Event extends QueuesFetchIdEvent {
  final id;

  Queues_FetchById_onButtonPressed_Event(this.id);

  @override
  List<Object> get props => [id];
}

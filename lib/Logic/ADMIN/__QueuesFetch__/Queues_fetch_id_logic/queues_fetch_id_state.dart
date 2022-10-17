part of 'queues_fetch_id_bloc.dart';

abstract class QueuesFetchIdState extends Equatable {
  const QueuesFetchIdState();

  @override
  List<Object> get props => [];
}

class QueuesFetchIdInitial extends QueuesFetchIdState {}

class Queues_FetchById_Loading_State extends QueuesFetchIdState {}

class Queues_FetchById_Loaded_State extends QueuesFetchIdState {
  final modelObj;
  Queues_FetchById_Loaded_State(this.modelObj);
}

class Queues_FetchById_Error_State extends QueuesFetchIdState {
  final error;
  Queues_FetchById_Error_State(this.error);
}

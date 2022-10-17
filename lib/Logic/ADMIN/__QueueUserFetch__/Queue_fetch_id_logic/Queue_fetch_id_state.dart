part of 'Queue_fetch_id_bloc.dart';

abstract class QueueFetchIdState extends Equatable {
  const QueueFetchIdState();

  @override
  List<Object> get props => [];
}

class QueueFetchIdInitial extends QueueFetchIdState {}

class Queue_FetchById_Loading_State extends QueueFetchIdState {}

class Queue_FetchById_Loaded_State extends QueueFetchIdState {
  final modelObj;
  Queue_FetchById_Loaded_State(this.modelObj);
}

class Queue_FetchById_Error_State extends QueueFetchIdState {
  final error;
  Queue_FetchById_Error_State(this.error);
}

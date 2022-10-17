part of 'Queues_cud_bloc.dart';

abstract class QueuesCudState extends Equatable {
  const QueuesCudState();

  @override
  List<Object> get props => [];
}

class QueuesCudInitial extends QueuesCudState {}

//! create

class Queues_create_Loading_State extends QueuesCudState {}

class Queues_create_Loaded_State extends QueuesCudState {}

class Queues_CantCreateMorethan5queue_State extends QueuesCudState {}

class Queues_create_Error_State extends QueuesCudState {
  final error;
  Queues_create_Error_State(this.error);
}

//! update

class Queues_update_Loading_State extends QueuesCudState {}

class Queues_update_Loaded_State extends QueuesCudState {}

class Queues_update_Error_State extends QueuesCudState {
  final error;
  Queues_update_Error_State(this.error);
}

//! delete
class Queues_Delete_Loading_state extends QueuesCudState {} //loading

class Queues_Delete_Loaded_state extends QueuesCudState {} //loaded

class Queues_Delete_Error_State extends QueuesCudState {
  final error;
  Queues_Delete_Error_State(this.error);
}

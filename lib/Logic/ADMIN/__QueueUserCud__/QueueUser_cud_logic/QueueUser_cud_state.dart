part of 'QueueUser_cud_bloc.dart';

abstract class QueueUserCudState extends Equatable {
  const QueueUserCudState();

  @override
  List<Object> get props => [];
}

class QueueUserCudInitial extends QueueUserCudState {}

//! create

class QueueUser_create_Loading_State extends QueueUserCudState {}

class QueueUser_create_Loaded_State extends QueueUserCudState {}

class QueueUser_Cant_create_already_exists_State extends QueueUserCudState {
  final msg;

  QueueUser_Cant_create_already_exists_State(this.msg);

  @override
  List<Object> get props => [msg];
}

class QueueUser_create_Error_State extends QueueUserCudState {
  final error;
  QueueUser_create_Error_State(this.error);

  @override
  List<Object> get props => [error];
}

//! update

class QueueUser_update_Loading_State extends QueueUserCudState {}

class QueueUser_update_Loaded_State extends QueueUserCudState {}

class QueueUser_update_Error_State extends QueueUserCudState {
  final error;
  QueueUser_update_Error_State(this.error);
}

//! delete
class QueueUser_Delete_Loading_state extends QueueUserCudState {} //loading

class QueueUser_Delete_Loaded_state extends QueueUserCudState {} //loaded

class QueueUser_Delete_Error_State extends QueueUserCudState {
  final error;
  QueueUser_Delete_Error_State(this.error);
}

//! notify by email
class QueueUser_NotifyEmail_SentSuccessfully_state extends QueueUserCudState {}

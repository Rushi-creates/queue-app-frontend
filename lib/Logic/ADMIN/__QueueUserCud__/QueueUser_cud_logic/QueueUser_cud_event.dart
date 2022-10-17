part of 'QueueUser_cud_bloc.dart';

abstract class QueueUserCudEvent extends Equatable {
  const QueueUserCudEvent();

  @override
  List<Object> get props => [];
}

//! create

class QueueUser_create_onButtonPressed_Event extends QueueUserCudEvent {
  final modelObjToAdd;
  QueueUser_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class QueueUser_Update_onButtonPressed_Event extends QueueUserCudEvent {
  final modelObjToAdd;
  final modelObj_id;
  QueueUser_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class QueueUser_Delete_onButtonPressed_Event extends QueueUserCudEvent {
  final modelObj_id;
  QueueUser_Delete_onButtonPressed_Event(this.modelObj_id);
}

//! notify next 5th queueUser by email
class QueueUser_Notify_Next5th_queueUserByEmail_Event
    extends QueueUserCudEvent {
  final queueUserEmail;

  QueueUser_Notify_Next5th_queueUserByEmail_Event(this.queueUserEmail);

  @override
  List<Object> get props => [queueUserEmail];
}

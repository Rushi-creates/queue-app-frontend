part of 'Queues_cud_bloc.dart';

abstract class QueuesCudEvent extends Equatable {
  const QueuesCudEvent();

  @override
  List<Object> get props => [];
}

//! create

class Queues_create_onButtonPressed_Event extends QueuesCudEvent {
  final modelObjToAdd;
  Queues_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class Queues_Update_onButtonPressed_Event extends QueuesCudEvent {
  final modelObjToAdd;
  final modelObj_id;
  Queues_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class Queues_Delete_onButtonPressed_Event extends QueuesCudEvent {
  final modelObj_id;
  Queues_Delete_onButtonPressed_Event(this.modelObj_id);
}

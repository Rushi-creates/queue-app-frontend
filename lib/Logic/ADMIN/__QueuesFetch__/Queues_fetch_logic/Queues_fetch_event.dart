part of 'Queues_fetch_bloc.dart';

abstract class QueuesFetchEvent extends Equatable {
  const QueuesFetchEvent();

  @override
  List<Object> get props => [];
}

class Queues_Fetch_onInit_Event extends QueuesFetchEvent {}

class Queues_Fetch_onInit_fromDiffProfile_Event extends QueuesFetchEvent {
  final adminAcc_fk;
  Queues_Fetch_onInit_fromDiffProfile_Event(this.adminAcc_fk);

  @override
  List<Object> get props => [adminAcc_fk];
}

class Queues_Fetch_onRefresh_Event extends QueuesFetchEvent {}

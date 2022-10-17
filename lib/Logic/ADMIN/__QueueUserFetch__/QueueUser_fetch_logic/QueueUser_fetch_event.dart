part of 'QueueUser_fetch_bloc.dart';

abstract class QueueUserFetchEvent extends Equatable {
  const QueueUserFetchEvent();

  @override
  List<Object> get props => [];
}

class QueueUser_Fetch_onInit_Event extends QueueUserFetchEvent {
  final queue_uid;

  QueueUser_Fetch_onInit_Event(this.queue_uid);
}

class QueueUser_Fetch_onRefresh_Event extends QueueUserFetchEvent {}

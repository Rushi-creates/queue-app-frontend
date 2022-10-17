part of 'CurrentQueues_fetch_bloc.dart';

abstract class CurrentQueuesFetchEvent extends Equatable {
  const CurrentQueuesFetchEvent();

  @override
  List<Object> get props => [];
}

class CurrentQueues_Fetch_onInit_Event extends CurrentQueuesFetchEvent {}

class CurrentQueues_Fetch_onRefresh_Event extends CurrentQueuesFetchEvent {}

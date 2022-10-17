part of 'CurrentQueues_fetch_bloc.dart';

abstract class CurrentQueuesFetchState extends Equatable {
  const CurrentQueuesFetchState();

  @override
  List<Object> get props => [];
}

class CurrentQueuesFetchInitial extends CurrentQueuesFetchState {}

class CurrentQueues_Fetch_Loading_State extends CurrentQueuesFetchState {
  final prevList;
  CurrentQueues_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class CurrentQueues_Fetch_Loaded_State extends CurrentQueuesFetchState {
  final modelObjList;
  CurrentQueues_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class CurrentQueues_Fetch_Error_State extends CurrentQueuesFetchState {
  final error;
  final prevList;

  CurrentQueues_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class CurrentQueues_Fetch_More_Loaded_ButEmpty_State
    extends CurrentQueuesFetchState {
  final prevList;
  CurrentQueues_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

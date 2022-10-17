part of 'Queues_fetch_bloc.dart';

abstract class QueuesFetchState extends Equatable {
  const QueuesFetchState();

  @override
  List<Object> get props => [];
}

class QueuesFetchInitial extends QueuesFetchState {}

class Queues_Fetch_Loading_State extends QueuesFetchState {
  final prevList;
  Queues_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

// class Queues_Fetch_LoadingTimeOut_State extends QueuesFetchState {
//   final prevList;
//   Queues_Fetch_LoadingTimeOut_State(this.prevList);

//   @override
//   List<Object> get props => [prevList];
// }

class Queues_Fetch_Loaded_State extends QueuesFetchState {
  final modelObjList;
  Queues_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class Queues_Fetch_Error_State extends QueuesFetchState {
  final error;
  final prevList;

  Queues_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class Queues_Fetch_More_Loaded_ButEmpty_State extends QueuesFetchState {
  final prevList;
  Queues_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

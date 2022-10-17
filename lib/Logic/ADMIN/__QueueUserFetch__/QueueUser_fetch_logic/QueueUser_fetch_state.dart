part of 'QueueUser_fetch_bloc.dart';

abstract class QueueUserFetchState extends Equatable {
  const QueueUserFetchState();

  @override
  List<Object> get props => [];
}

class QueueUserFetchInitial extends QueueUserFetchState {}

class QueueUser_Fetch_Loading_State extends QueueUserFetchState {
  final prevList;
  QueueUser_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class QueueUser_Fetch_Loaded_State extends QueueUserFetchState {
  final modelObjList;
  QueueUser_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class QueueUser_Fetch_Error_State extends QueueUserFetchState {
  final prevList;
  final error;
  QueueUser_Fetch_Error_State(this.error, this.prevList);
  @override
  List<Object> get props => [prevList, error];
}

class QueueUser_Fetch_More_Loaded_ButEmpty_State extends QueueUserFetchState {
  final prevList;

  QueueUser_Fetch_More_Loaded_ButEmpty_State(this.prevList);
  @override
  List<Object> get props => [prevList];
}

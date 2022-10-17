part of 'SearchAdmin_fetch_bloc.dart';

abstract class SearchAdminFetchState extends Equatable {
  const SearchAdminFetchState();

  @override
  List<Object> get props => [];
}

class SearchAdminFetchInitial extends SearchAdminFetchState {}

class SearchAdmin_Fetch_Loading_State extends SearchAdminFetchState {
  final prevList;
  SearchAdmin_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class SearchAdmin_Fetch_Loaded_State extends SearchAdminFetchState {
  final modelObjList;
  SearchAdmin_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class SearchAdmin_Fetch_Error_State extends SearchAdminFetchState {
  final error;
  final prevList;

  SearchAdmin_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class SearchAdmin_Fetch_More_Loaded_ButEmpty_State
    extends SearchAdminFetchState {
  final prevList;
  SearchAdmin_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

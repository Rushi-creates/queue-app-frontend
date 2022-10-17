part of 'admin_fetch_id_bloc.dart';

abstract class AdminFetchIdState extends Equatable {
  const AdminFetchIdState();

  @override
  List<Object> get props => [];
}

class AdminFetchIdInitial extends AdminFetchIdState {}

class Admin_FetchById_Loading_State extends AdminFetchIdState {}

class Admin_FetchById_Loaded_State extends AdminFetchIdState {
  final modelObj;
  Admin_FetchById_Loaded_State(this.modelObj);
}

class Admin_FetchById_Error_State extends AdminFetchIdState {
  final error;
  Admin_FetchById_Error_State(this.error);
}

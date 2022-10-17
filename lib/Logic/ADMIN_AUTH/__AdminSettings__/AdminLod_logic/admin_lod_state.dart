part of 'admin_lod_bloc.dart';

abstract class AdminLodState extends Equatable {
  const AdminLodState();

  @override
  List<Object> get props => [];
}

class AdminLodInitial extends AdminLodState {}

//! Logout
class AdminLogout_Loading_State extends AdminLodState {}

class AdminLogout_Success_State extends AdminLodState {}

class AdminLogout_Failure_State extends AdminLodState {}

// //! Logout for SuperAdmin
// class AdminLogout_SuperAdmin_Loading_State extends AdminLodState {}

// class AdminLogout_SuperAdmin_Success_State extends AdminLodState {}

// class AdminLogout_SuperAdmin_Failure_State extends AdminLodState {}

//! Delete admin Account

class AdminDeleteAdminAccount_Loading_State extends AdminLodState {}

class AdminDeleteAdminAccount_Success_State extends AdminLodState {}

class AdminDeleteAdminAccount_Failure_State extends AdminLodState {}

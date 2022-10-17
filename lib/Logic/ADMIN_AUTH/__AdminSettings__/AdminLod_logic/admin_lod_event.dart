part of 'admin_lod_bloc.dart';

abstract class AdminLodEvent extends Equatable {
  const AdminLodEvent();

  @override
  List<Object> get props => [];
}

//! Logout
class AdminLogoutButtonPressedEvent extends AdminLodEvent {}

//! Logout for superadmin
// class Logout_forSuperAdmin_ButtonPressedEvent extends AdminLodEvent {}

//! Delete admin account (admin is also considered as admin)
class AdminDeleteAdminAccount_ButtonPressedEvent extends AdminLodEvent {}

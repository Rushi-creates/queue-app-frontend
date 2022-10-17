part of 'logout_sa_bloc.dart';

abstract class LogoutSaEvent extends Equatable {
  const LogoutSaEvent();

  @override
  List<Object> get props => [];
}

//! Logout for superadmin
class Logout_forSuperAdmin_ButtonPressedEvent extends LogoutSaEvent {}

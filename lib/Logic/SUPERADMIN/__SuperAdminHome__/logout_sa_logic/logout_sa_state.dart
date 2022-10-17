part of 'logout_sa_bloc.dart';

abstract class LogoutSaState extends Equatable {
  const LogoutSaState();

  @override
  List<Object> get props => [];
}

class LogoutSaInitial extends LogoutSaState {}

//! Logout for SuperAdmin
class Logout_SuperAdmin_Loading_State extends LogoutSaState {}

class Logout_SuperAdmin_Success_State extends LogoutSaState {}

class Logout_SuperAdmin_Failure_State extends LogoutSaState {}

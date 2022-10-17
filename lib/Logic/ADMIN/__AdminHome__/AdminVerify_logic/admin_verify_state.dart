part of 'admin_verify_bloc.dart';

abstract class AdminVerifyState extends Equatable {
  const AdminVerifyState();

  @override
  List<Object> get props => [];
}

class AdminVerifyInitial extends AdminVerifyState {}

//! Admin Home screen states
class isAdmin_check_loading_State extends AdminVerifyState {}

class isAdmin_check_Error_State extends AdminVerifyState {}

class isAdmin_verified_State extends AdminVerifyState {} //check and accpeted

class isAdmin_NOT_verified_state extends AdminVerifyState {} //not checked
//there is not state for rejected , as when admin get reject by superadmin
//then admin account is deleted , from api , if rejected by superadmin
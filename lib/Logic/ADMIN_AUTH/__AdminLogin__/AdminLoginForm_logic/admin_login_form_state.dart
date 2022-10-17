part of 'admin_login_form_bloc.dart';

abstract class AdminLoginFormState extends Equatable {
  const AdminLoginFormState();

  @override
  List<Object> get props => [];
}

class AdminLoginFormInitial extends AdminLoginFormState {}

class AdminLoginEmail_valid_State extends AdminLoginFormState {}

class AdminLoginPass_valid_State extends AdminLoginFormState {}

class AdminLoginEmail_NOT_Valid_State extends AdminLoginFormState {
  final error;
  AdminLoginEmail_NOT_Valid_State(this.error);
  @override
  List<Object> get props => [error];
}

class AdminLoginPass_NOT_Valid_State extends AdminLoginFormState {
  final error;
  AdminLoginPass_NOT_Valid_State(this.error);
  @override
  List<Object> get props => [error];
}

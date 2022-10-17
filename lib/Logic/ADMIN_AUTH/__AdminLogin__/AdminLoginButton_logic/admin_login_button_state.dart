part of 'admin_login_button_bloc.dart';

abstract class AdminLoginButtonState extends Equatable {
  const AdminLoginButtonState();

  @override
  List<Object> get props => [];
}

class AdminLoginButtonInitial extends AdminLoginButtonState {}

class AdminLoginLoadingState extends AdminLoginButtonState {}

class AdminLoginSuccessState extends AdminLoginButtonState {}

class AdminLoginFailure_accountDontExist_State extends AdminLoginButtonState {
  final msg;
  AdminLoginFailure_accountDontExist_State(this.msg);
}

class AdminLogin_UnknownError_State extends AdminLoginButtonState {
  final error;
  AdminLogin_UnknownError_State(this.error);
  @override
  List<Object> get props => [error];
}

part of 'admin_login_form_bloc.dart';

abstract class AdminLoginFormEvent extends Equatable {
  const AdminLoginFormEvent();

  @override
  List<Object> get props => [];
}

class AdminLoginEmail_Changed_Event extends AdminLoginFormEvent {
  final String emailController;
  AdminLoginEmail_Changed_Event(this.emailController);
  @override
  List<Object> get props => [emailController];
}

class AdminLoginPass_Changed_Event extends AdminLoginFormEvent {
  final passwordController;
  AdminLoginPass_Changed_Event(this.passwordController);
  @override
  List<Object> get props => [passwordController];
}

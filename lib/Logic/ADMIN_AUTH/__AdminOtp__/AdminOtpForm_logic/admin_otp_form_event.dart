part of 'admin_otp_form_bloc.dart';

abstract class AdminOtpFormEvent extends Equatable {
  const AdminOtpFormEvent();

  @override
  List<Object> get props => [];
}

class AdminRegEmail_Changed_Event extends AdminOtpFormEvent {
  final String emailController;
  AdminRegEmail_Changed_Event(this.emailController);
  @override
  List<Object> get props => [emailController];
}

class AdminRegNumber_Changed_Event extends AdminOtpFormEvent {
  final numberController;
  AdminRegNumber_Changed_Event(this.numberController);
  @override
  List<Object> get props => [numberController];
}

class AdminRegPass_Changed_Event extends AdminOtpFormEvent {
  final passwordController;
  AdminRegPass_Changed_Event(this.passwordController);
  @override
  List<Object> get props => [passwordController];
}

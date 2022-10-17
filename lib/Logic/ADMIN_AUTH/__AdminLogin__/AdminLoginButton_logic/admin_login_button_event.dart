part of 'admin_login_button_bloc.dart';

abstract class AdminLoginButtonEvent extends Equatable {
  const AdminLoginButtonEvent();

  @override
  List<Object> get props => [];
}

class AdminLoginButton_Clicked_Event extends AdminLoginButtonEvent {
  final modelObj;

  AdminLoginButton_Clicked_Event(this.modelObj);
  @override
  List<Object> get props => [modelObj];
}

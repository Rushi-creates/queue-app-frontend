part of 'admin_switch_screen_bloc.dart';

abstract class AdminSwitchScreenEvent extends Equatable {
  const AdminSwitchScreenEvent();

  @override
  List<Object> get props => [];
}

class SwitchToLogin_Event extends AdminSwitchScreenEvent {}

class SwitchToRegister_Event extends AdminSwitchScreenEvent {}

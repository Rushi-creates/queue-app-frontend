part of 'admin_switch_screen_bloc.dart';

abstract class AdminSwitchScreenState extends Equatable {
  const AdminSwitchScreenState();

  @override
  List<Object> get props => [];
}

class AdminSwitchScreenInitial extends AdminSwitchScreenState {}

class SwitchedToLogin_State extends AdminSwitchScreenState {}

class SwitchedToRegister_State extends AdminSwitchScreenState {}

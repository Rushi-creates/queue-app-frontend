part of 'admin_reg_button_bloc.dart';

abstract class AdminRegButtonState extends Equatable {
  const AdminRegButtonState();

  @override
  List<Object> get props => [];
}

class AdminRegButtonInitial extends AdminRegButtonState {}

class AdminRegisterLoadingState extends AdminRegButtonState {}

class AdminRegisterSuccessState extends AdminRegButtonState {}

class OtpDidntMatched_State extends AdminRegButtonState {}

class AdminRegister_UnknownError_State extends AdminRegButtonState {
  final error;

  AdminRegister_UnknownError_State(this.error);
  @override
  List<Object> get props => [error];
}

part of 'admin_otp_form_bloc.dart';

abstract class AdminOtpFormState extends Equatable {
  const AdminOtpFormState();

  @override
  List<Object> get props => [];
}

class AdminOtpFormInitial extends AdminOtpFormState {}

class AdminRegEmail_valid_State extends AdminOtpFormState {}

class AdminRegNumber_valid_State extends AdminOtpFormState {}

class AdminRegPass_valid_State extends AdminOtpFormState {}

class AdminRegEmail_NOT_Valid_State extends AdminOtpFormState {
  final error;
  AdminRegEmail_NOT_Valid_State(this.error);

  @override
  List<Object> get props => [error];
}

class AdminRegNumber_NOT_Valid_State extends AdminOtpFormState {
  final error;
  AdminRegNumber_NOT_Valid_State(this.error);

  @override
  List<Object> get props => [error];
}

class AdminRegPass_NOT_Valid_State extends AdminOtpFormState {
  final error;
  AdminRegPass_NOT_Valid_State(this.error);

  @override
  List<Object> get props => [error];
}

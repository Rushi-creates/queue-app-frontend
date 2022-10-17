part of 'admin_otp_button_bloc.dart';

abstract class AdminOtpButtonState extends Equatable {
  const AdminOtpButtonState();

  @override
  List<Object> get props => [];
}

class AdminOtpButtonInitial extends AdminOtpButtonState {}

class AdminOtp_LoadingState extends AdminOtpButtonState {}

class AdminOtp_SuccessState extends AdminOtpButtonState {
  final otp;
  AdminOtp_SuccessState(this.otp);
  @override
  List<Object> get props => [otp];
}

class AdminOtp_accountAlreadyExists_State extends AdminOtpButtonState {
  final msg;
  AdminOtp_accountAlreadyExists_State(this.msg);
}

class AdminOtp_UnknownError_State extends AdminOtpButtonState {
  final error;
  AdminOtp_UnknownError_State(this.error);
  @override
  List<Object> get props => [error];
}

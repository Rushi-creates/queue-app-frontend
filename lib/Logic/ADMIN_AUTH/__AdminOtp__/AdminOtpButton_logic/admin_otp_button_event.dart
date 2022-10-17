part of 'admin_otp_button_bloc.dart';

abstract class AdminOtpButtonEvent extends Equatable {
  const AdminOtpButtonEvent();

  @override
  List<Object> get props => [];
}

class AdminOtpButtonClicked_Event extends AdminOtpButtonEvent {
  final modelObj;

  AdminOtpButtonClicked_Event(this.modelObj);
  @override
  List<Object> get props => [modelObj];
}

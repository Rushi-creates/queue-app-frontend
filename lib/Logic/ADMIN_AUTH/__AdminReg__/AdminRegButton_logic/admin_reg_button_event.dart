part of 'admin_reg_button_bloc.dart';

abstract class AdminRegButtonEvent extends Equatable {
  const AdminRegButtonEvent();

  @override
  List<Object> get props => [];
}

class AdminRegButtonClicked_Event extends AdminRegButtonEvent {
  final modelObjToAdd;
  final otpFromPreviousPage;
  final otpFromTextField;

  AdminRegButtonClicked_Event({
    required this.modelObjToAdd,
    required this.otpFromPreviousPage,
    required this.otpFromTextField,
  });

  @override
  List<Object> get props =>
      [modelObjToAdd, otpFromPreviousPage, otpFromTextField];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_otp_form_event.dart';
part 'admin_otp_form_state.dart';

class AdminOtpFormBloc extends Bloc<AdminOtpFormEvent, AdminOtpFormState> {
  AdminOtpFormBloc() : super(AdminOtpFormInitial()) {
    on<AdminRegEmail_Changed_Event>((event, emit) {
      if (event.emailController == '') {
        emit(AdminRegEmail_NOT_Valid_State('Email cannot be empty'));
      } else if (!event.emailController.contains('@')) {
        emit(AdminRegEmail_NOT_Valid_State('Email should contain @'));
      } else if (!event.emailController.contains('.')) {
        emit(AdminRegEmail_NOT_Valid_State('Email should contain .'));
      } else {
        emit(AdminRegPass_valid_State());
      }
    });

    //
    on<AdminRegNumber_Changed_Event>((event, emit) {
      if (event.numberController == '') {
        emit(AdminRegNumber_NOT_Valid_State('Number cannot be empty'));
      } else if (event.numberController.length < 10) {
        emit(AdminRegNumber_NOT_Valid_State(
            'Number should be of length 10 digits'));
      } else {
        emit(AdminRegNumber_valid_State());
      }
    });

    on<AdminRegPass_Changed_Event>((event, emit) {
      if (event.passwordController == '') {
        emit(AdminRegPass_NOT_Valid_State('Password cannot be empty'));
      } else if (event.passwordController.length < 4) {
        emit(AdminRegPass_NOT_Valid_State('Password is too short'));
      } else {
        emit(AdminRegPass_valid_State());
      }
    });
  }
}

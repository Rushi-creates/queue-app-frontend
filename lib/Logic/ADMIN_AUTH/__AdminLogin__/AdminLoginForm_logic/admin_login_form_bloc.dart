import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_login_form_event.dart';
part 'admin_login_form_state.dart';

class AdminLoginFormBloc
    extends Bloc<AdminLoginFormEvent, AdminLoginFormState> {
  AdminLoginFormBloc() : super(AdminLoginFormInitial()) {
    on<AdminLoginEmail_Changed_Event>((event, emit) {
      if (event.emailController == '') {
        emit(AdminLoginEmail_NOT_Valid_State('Email cannot be empty'));
      } else if (!event.emailController.contains('@')) {
        emit(AdminLoginEmail_NOT_Valid_State('Email should contain @'));
      } else if (!event.emailController.contains('.')) {
        emit(AdminLoginEmail_NOT_Valid_State('Email should contain .'));
      } else {
        emit(AdminLoginPass_valid_State());
      }
    });

    //
    on<AdminLoginPass_Changed_Event>((event, emit) {
      if (event.passwordController == '') {
        emit(AdminLoginPass_NOT_Valid_State('Password cannot be empty'));
      } else if (event.passwordController.length < 4) {
        emit(AdminLoginPass_NOT_Valid_State('Password is too short'));
      } else {
        emit(AdminLoginPass_valid_State());
      }
    });
  }
}

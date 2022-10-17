import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repository_layer/AdminAcc_repo.dart';
import '../../../../service_layer/Exceptions/Exceptions.dart';
import '../../../../service_layer/models/AdminAcc.dart';

part 'admin_login_button_event.dart';
part 'admin_login_button_state.dart';

class AdminLoginButtonBloc
    extends Bloc<AdminLoginButtonEvent, AdminLoginButtonState> {
  AdminLoginButtonBloc() : super(AdminLoginButtonInitial()) {
    AdminAcc_api_repo adminAcc_api_repo = AdminAcc_api_repo();
    AdminAcc_sp_repo adminAcc_sp_repo = AdminAcc_sp_repo();

    /* -------------------------------------------------------------------------- */
/*                               //@ Login Admin                               */
/* -------------------------------------------------------------------------- */

    on<AdminLoginButton_Clicked_Event>((event, emit) async {
      emit(AdminLoginLoadingState());

      try {
        print('started login');

        var response =
            await adminAcc_api_repo.create_loginAdmin(event.modelObj);

        if (response is AdminAcc) {
          //# Set sp : store new Admin/Admin creds to SP
          await adminAcc_sp_repo.spStore_AdminAccObj(response);
          emit(AdminLoginSuccessState());

          //# LOGIC : reponse is Stirng , means acc NOT added to DB (already exists)
        } else if (response is String) {
          emit(AdminLoginFailure_accountDontExist_State(response));
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(AdminLogin_UnknownError_State(storeErr));
      }
    });
  }
}

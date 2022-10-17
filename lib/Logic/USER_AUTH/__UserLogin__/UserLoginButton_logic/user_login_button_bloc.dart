import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repository_layer/UserAcc_repo.dart';
import '../../../../service_layer/Exceptions/Exceptions.dart';
import '../../../../service_layer/models/UserAcc.dart';

part 'user_login_button_event.dart';
part 'user_login_button_state.dart';

class UserLoginButtonBloc
    extends Bloc<UserLoginButtonEvent, UserLoginButtonState> {
  UserLoginButtonBloc() : super(UserLoginButtonInitial()) {
    UserAcc_api_repo userAcc_api_repo = UserAcc_api_repo();
    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();

/* -------------------------------------------------------------------------- */
/*                               //@ Login User                               */
/* -------------------------------------------------------------------------- */

    on<UserLoginButton_Clicked_Event>((event, emit) async {
      emit(UserLoginLoadingState());

      try {
        print('started login');

        var response = await userAcc_api_repo.create_loginUser(event.modelObj);

        if (response is UserAcc) {
          //# Set sp : store new User/Admin creds to SP
          await userAcc_sp_repo.spStore_UserAccObj(response);
          emit(UserLoginSuccessState());

          //# LOGIC : reponse is Stirng , means acc NOT added to DB (already exists)
        } else if (response is String) {
          emit(UserLoginFailure_accountDontExist_State(response));
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(UserLogin_UnknownError_State(storeErr));
      }
    });
  }
}

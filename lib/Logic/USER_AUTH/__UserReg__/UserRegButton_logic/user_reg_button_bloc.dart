import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repository_layer/UserAcc_repo.dart';
import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'user_reg_button_event.dart';
part 'user_reg_button_state.dart';

class UserRegButtonBloc extends Bloc<UserRegButtonEvent, UserRegButtonState> {
  UserRegButtonBloc() : super(UserRegButtonInitial()) {
    UserAcc_api_repo userAcc_api_repo = UserAcc_api_repo();
    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();

    on<UserRegButtonClicked_Event>((event, emit) async {
      emit(UserRegisterLoadingState());

      if (event.otpFromTextField == event.otpFromPreviousPage) {
        try {
          var response =
              await userAcc_api_repo.create_UserRegister(event.modelObjToAdd);

          //storing this response in SP
          await userAcc_sp_repo.spStore_UserAccObj(response);
          emit(UserRegisterSuccessState());

          //# error
        } catch (e) {
          var storeErr = CustomExceptions.checkExcp(e.runtimeType);
          emit(UserRegister_UnknownError_State(storeErr));
        }
      } else {
        emit(OtpDidntMatched_State());
      }
    });
  }
}

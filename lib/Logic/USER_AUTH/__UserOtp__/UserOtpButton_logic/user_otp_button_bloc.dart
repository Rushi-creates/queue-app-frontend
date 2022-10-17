import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repository_layer/UserAcc_repo.dart';
import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'user_otp_button_event.dart';
part 'user_otp_button_state.dart';

class UserOtpButtonBloc extends Bloc<UserOtpButtonEvent, UserOtpButtonState> {
  UserOtpButtonBloc() : super(UserOtpButtonInitial()) {
    UserAcc_api_repo userAcc_api_repo = UserAcc_api_repo();

    on<UserOtpButtonClicked_Event>((event, emit) async {
      print('otpbutton presed');
      emit(UserOtp_LoadingState());

      try {
        var response = await userAcc_api_repo
            .create_verifyUserEmail_SendOtp(event.modelObj);

        // response here has account already exists
        if (response is String) {
          emit(UserOtp_accountAlreadyExists_State(response));

          //response here has otp
        } else if (response is int) {
          emit(UserOtp_SuccessState(response));
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(UserOtp_UnknownError_State(storeErr));
      }
    });
  }
}

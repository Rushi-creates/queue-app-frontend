import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repository_layer/AdminAcc_repo.dart';
import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'admin_otp_button_event.dart';
part 'admin_otp_button_state.dart';

class AdminOtpButtonBloc
    extends Bloc<AdminOtpButtonEvent, AdminOtpButtonState> {
  AdminOtpButtonBloc() : super(AdminOtpButtonInitial()) {
    AdminAcc_api_repo adminAcc_api_repo = AdminAcc_api_repo();

    on<AdminOtpButtonClicked_Event>((event, emit) async {
      print('otpbutton presed');
      emit(AdminOtp_LoadingState());

      try {
        var response = await adminAcc_api_repo
            .create_verifyAdminEmail_SendOtp(event.modelObj);

        // response here has account already exists
        if (response is String) {
          emit(AdminOtp_accountAlreadyExists_State(response));

          //response here has otp
        } else if (response is int) {
          emit(AdminOtp_SuccessState(response));
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(AdminOtp_UnknownError_State(storeErr));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repository_layer/AdminAcc_repo.dart';
import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'admin_reg_button_event.dart';
part 'admin_reg_button_state.dart';

class AdminRegButtonBloc
    extends Bloc<AdminRegButtonEvent, AdminRegButtonState> {
  AdminRegButtonBloc() : super(AdminRegButtonInitial()) {
    AdminAcc_api_repo adminAcc_api_repo = AdminAcc_api_repo();
    AdminAcc_sp_repo adminAcc_sp_repo = AdminAcc_sp_repo();

    on<AdminRegButtonClicked_Event>((event, emit) async {
      emit(AdminRegisterLoadingState());

      if (event.otpFromTextField == event.otpFromPreviousPage) {
        try {
          var response =
              await adminAcc_api_repo.create_AdminRegister(event.modelObjToAdd);

          //storing this response in SP
          await adminAcc_sp_repo.spStore_AdminAccObj(response);
          emit(AdminRegisterSuccessState());

          //# error
        } catch (e) {
          var storeErr = CustomExceptions.checkExcp(e.runtimeType);
          emit(AdminRegister_UnknownError_State(storeErr));
        }
      } else {
        emit(OtpDidntMatched_State());
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/SA_repo.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'sa_auth_event.dart';
part 'sa_auth_state.dart';

class SaAuthBloc extends Bloc<SaAuthEvent, SaAuthState> {
  SaAuthBloc() : super(SaAuthInitial()) {
    //
    SA_api_repo sa_api_repo = SA_api_repo();
    SA_sp_repo sa_sp_repo = SA_sp_repo();

    //

    on<CheckSa_ButtonCLicked_Event>((event, emit) async {
      emit(SA_auth_LoadingState());

      try {
        print('started login');

        var response = await sa_api_repo.create_checkSuperAdmin(event.modelObj);

        if (response == true) {
          await sa_sp_repo.set_SA(response);
          emit(SA_auth_SuperString_Matched_Success_State());
        } else if (response == false) {
          emit(SA_auth_SuperString_NOT_matched_State());
        }

        //# error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(SA_auth_UnknownError_State(storeErr));
      }
    });
  }
}

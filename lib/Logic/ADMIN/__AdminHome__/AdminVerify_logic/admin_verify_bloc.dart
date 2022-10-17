import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Repository_layer/AdminAcc_repo.dart';
import 'package:no_queue2/service_layer/models/AdminAcc.dart';

part 'admin_verify_event.dart';
part 'admin_verify_state.dart';

class AdminVerifyBloc extends Bloc<AdminVerifyEvent, AdminVerifyState> {
  AdminVerifyBloc() : super(AdminVerifyInitial()) {
    //

    AdminAcc_api_repo adminAcc_api_repo = AdminAcc_api_repo();
    AdminAcc_sp_repo adminAcc_sp_repo = AdminAcc_sp_repo();
/* -------------------------------------------------------------------------- */
/*          //! Admin screen check : is made or rejected by superAdmin        */
/* -------------------------------------------------------------------------- */

    on<IsAdmin_verify_checkOnStartup_Event>((event, emit) async {
      emit(isAdmin_check_loading_State());

      //!  get SP : admin id from sp
      AdminAcc? adminObj = await adminAcc_sp_repo.spGet_AdminAccObj()!;
      int? storeID = adminObj?.id;

      try {
        //! get api : account by id
        if (storeID != null) {
          AdminAcc response =
              await adminAcc_api_repo.verifyAdmin_fetchById(storeID);

          //! logic
          if (response.isAdminVerified == true) {
            emit(isAdmin_verified_State());
          } else if (response.isAdminVerified == false) {
            emit(isAdmin_NOT_verified_state());
          }
        }

        //! error
      } catch (e) {
        emit(isAdmin_check_Error_State());
      }
    });

    on<IsAdmin_verify_checkOnStartup_fromDiffProfile_Event>(
        (event, emit) async {
      emit(isAdmin_check_loading_State());

      try {
        //! get api : account by id

        AdminAcc response =
            await adminAcc_api_repo.verifyAdmin_fetchById(event.profileID);

        //! logic
        if (response.isAdminVerified == true) {
          emit(isAdmin_verified_State());
        } else if (response.isAdminVerified == false) {
          emit(isAdmin_NOT_verified_state());
        }

        //! error
      } catch (e) {
        emit(isAdmin_check_Error_State());
      }
    });
  }
}

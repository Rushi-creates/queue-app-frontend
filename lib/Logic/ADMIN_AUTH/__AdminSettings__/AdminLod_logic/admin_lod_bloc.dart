import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repository_layer/AdminAcc_repo.dart';
import '../../../../service_layer/models/AdminAcc.dart';

part 'admin_lod_event.dart';
part 'admin_lod_state.dart';

class AdminLodBloc extends Bloc<AdminLodEvent, AdminLodState> {
  AdminLodBloc() : super(AdminLodInitial()) {
    final AdminAcc_sp_repo adminAcc_sp_repo = AdminAcc_sp_repo();
    final AdminAcc_api_repo adminAcc_api_repo = AdminAcc_api_repo();
/* -------------------------------------------------------------------------- */
/*                                 //! Logout                                 */
/* -------------------------------------------------------------------------- */

    on<AdminLogoutButtonPressedEvent>((event, emit) async {
      emit(AdminLogout_Loading_State());

      //# remove SP : after log out
      await adminAcc_sp_repo.spRemove_AdminAccObj().then((value) {
        emit(AdminLogout_Success_State());
      }).catchError((e, s) {
        emit(AdminLogout_Failure_State());
      });
    });

/* -------------------------------------------------------------------------- */
/*                          //! Logout for superAdmin                         */
/* -------------------------------------------------------------------------- */
    // on<Logout_forSuperAdmin_ButtonPressedEvent>((event, emit) async {
    //   emit(Logout_SuperAdmin_Loading_State());

    //   //# remove SP : remove superAdmin=true key , to log out SA
    //   await account_sp_repo.removeSuperAdmin().then((value) {
    //     emit(Logout_SuperAdmin_Success_State());
    //   }).catchError((e, st) {
    //     emit(Logout_SuperAdmin_Failure_State());
    //   });
    // });

/* -------------------------------------------------------------------------- */
/*                           //! Delete admin Account                          */
/* -------------------------------------------------------------------------- */
    on<AdminDeleteAdminAccount_ButtonPressedEvent>((event, emit) async {
      emit(AdminDeleteAdminAccount_Loading_State());

      //# get SP :
      AdminAcc admin = await adminAcc_sp_repo.spGet_AdminAccObj();
      int id = admin.id!;

      //Todo: delete each admin realated DB , using deleteByUid url path
      try {
        //# deleting acc from DB
        var response = await adminAcc_api_repo.deleteAdmin_account(id);
        print('response decoded from api===>$response');

        //# remove SP : when Admin/Admin deletes acc

        await adminAcc_sp_repo.spRemove_AdminAccObj().then((value) {
          emit(AdminDeleteAdminAccount_Success_State());
        }).catchError((e, s) {
          emit(AdminDeleteAdminAccount_Failure_State());
        });

        //#error
      } catch (e) {
        emit(AdminDeleteAdminAccount_Failure_State());
      }
    });
  }
}

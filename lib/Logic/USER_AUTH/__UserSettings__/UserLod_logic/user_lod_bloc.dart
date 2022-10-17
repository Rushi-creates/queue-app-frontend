import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Repository_layer/UserAcc_repo.dart';
import '../../../../service_layer/models/UserAcc.dart';

part 'user_lod_event.dart';
part 'user_lod_state.dart';

class UserLodBloc extends Bloc<UserLodEvent, UserLodState> {
  UserLodBloc() : super(UserLodInitial()) {
    final UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
    final UserAcc_api_repo userAcc_api_repo = UserAcc_api_repo();
/* -------------------------------------------------------------------------- */
/*                                 //! Logout                                 */
/* -------------------------------------------------------------------------- */

    on<UserLogoutButtonPressedEvent>((event, emit) async {
      emit(UserLogout_Loading_State());

      //# remove SP : after log out
      await userAcc_sp_repo.spRemove_UserAccObj().then((value) {
        emit(UserLogout_Success_State());
      }).catchError((e, s) {
        emit(UserLogout_Failure_State());
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
/*                           //! Delete user Account                          */
/* -------------------------------------------------------------------------- */
    on<UserDeleteUserAccount_ButtonPressedEvent>((event, emit) async {
      emit(UserDeleteUserAccount_Loading_State());

      //# get SP :
      UserAcc user = await userAcc_sp_repo.spGet_UserAccObj();
      int id = user.id!;

      //Todo: delete each user realated DB , using deleteByUid url path
      try {
        //# deleting acc from DB
        var response = await userAcc_api_repo.deleteUser_account(id);
        print('response decoded from api===>$response');

        //# remove SP : when User/Admin deletes acc

        await userAcc_sp_repo.spRemove_UserAccObj().then((value) {
          emit(UserDeleteUserAccount_Success_State());
        }).catchError((e, s) {
          emit(UserDeleteUserAccount_Failure_State());
        });

        //#error
      } catch (e) {
        emit(UserDeleteUserAccount_Failure_State());
      }
    });
  }
}

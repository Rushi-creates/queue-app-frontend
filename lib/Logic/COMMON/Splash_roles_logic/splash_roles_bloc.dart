import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/AdminAcc_repo.dart';
import 'package:no_queue2/Repository_layer/SA_repo.dart';
import 'package:no_queue2/Repository_layer/UserAcc_repo.dart';
import 'package:no_queue2/service_layer/models/AdminAcc.dart';
import 'package:no_queue2/service_layer/models/UserAcc.dart';

part 'splash_roles_event.dart';
part 'splash_roles_state.dart';

class SplashRolesBloc extends Bloc<SplashRolesEvent, SplashRolesState> {
  SplashRolesBloc() : super(SplashRolesInitial()) {
    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
    AdminAcc_sp_repo adminAcc_sp_repo = AdminAcc_sp_repo();
    SA_sp_repo sa_sp_repo = SA_sp_repo();
/* -------------------------------------------------------------------------- */
/*                       //! Check role in splash screen                      */
/* -------------------------------------------------------------------------- */
    on<CheckRole_OnAppStartUpEvent>((event, emit) async {
      emit(RoleLoadingState());

      try {
        UserAcc? currentUserAccObj = await userAcc_sp_repo.spGet_UserAccObj();
        AdminAcc? currentAdminAccObj =
            await adminAcc_sp_repo.spGet_AdminAccObj();

        bool? currentSuperAdmin = await sa_sp_repo.get_SA();

        if (currentUserAccObj != null) {
          print('user role');
          emit(User_Role_State());
        } else if (currentAdminAccObj != null) {
          print('admin role');
          emit(Admin_Role_State());
        } else if (currentSuperAdmin != null) {
          print('superadmin role');
          emit(SuperAdmin_Role_State());
        } else {
          emit(SelectRoleScreen_state());
        }

        //! logic
      } catch (e) {
        print('role error state $e');
        emit(RoleErrorState());
      }
    });
  }
}

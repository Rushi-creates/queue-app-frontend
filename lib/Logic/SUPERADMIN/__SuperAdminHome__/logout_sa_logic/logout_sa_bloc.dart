import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Repository_layer/SA_repo.dart';

part 'logout_sa_event.dart';
part 'logout_sa_state.dart';

class LogoutSaBloc extends Bloc<LogoutSaEvent, LogoutSaState> {
  LogoutSaBloc() : super(LogoutSaInitial()) {
    final SA_api_repo sa_api_repo = SA_api_repo();
    final SA_sp_repo sa_sp_repo = SA_sp_repo();
/* -------------------------------------------------------------------------- */
/*                          //! Logout for superAdmin                         */
/* -------------------------------------------------------------------------- */
    on<Logout_forSuperAdmin_ButtonPressedEvent>((event, emit) async {
      emit(Logout_SuperAdmin_Loading_State());

      //# remove SP : remove superAdmin=true key , to log out SA
      await sa_sp_repo.remove_SA().then((value) {
        emit(Logout_SuperAdmin_Success_State());
      }).catchError((e, st) {
        emit(Logout_SuperAdmin_Failure_State());
      });
    });
  }
}

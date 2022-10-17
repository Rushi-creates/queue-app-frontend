import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/AdminAcc_repo.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'admin_fetch_id_event.dart';
part 'admin_fetch_id_state.dart';

class AdminFetchIdBloc extends Bloc<AdminFetchIdEvent, AdminFetchIdState> {
  AdminFetchIdBloc() : super(AdminFetchIdInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class objs                            */
/* -------------------------------------------------------------------------- */

    AdminAcc_api_repo adminAcc_api_repo = AdminAcc_api_repo();

/* -------------------------------------------------------------------------- */
/*                           //@ fetch single by id                           */
/* -------------------------------------------------------------------------- */
    on<Admin_FetchById_onButtonPressed_Event>((event, emit) async {
      try {
        emit(Admin_FetchById_Loading_State());

        //# from api repo class
        final response = await adminAcc_api_repo.fetchById(event.id);

        //# from GS repo class  ( uncomment if using gs )
        // final response = await admin_Gs_Repo.fetchById_admin(event.id);
        emit(Admin_FetchById_Loaded_State(response));

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Admin_FetchById_Error_State(storeErr));
      }
    });
  }
}

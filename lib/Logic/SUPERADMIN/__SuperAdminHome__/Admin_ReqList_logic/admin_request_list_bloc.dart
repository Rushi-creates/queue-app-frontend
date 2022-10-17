import 'package:no_queue2/Repository_layer/AdminAcc_repo.dart';

import '../../../../../service_layer/Exceptions/Exceptions.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_request_list_event.dart';
part 'admin_request_list_state.dart';

class AdminRequestListBloc
    extends Bloc<AdminRequestListEvent, AdminRequestListState> {
  int counter = 1;

  AdminRequestListBloc() : super(AdminRequestListInitial()) {
    List totalList = [];
    List secondList = [];

    //! objects
    final AdminAcc_api_repo adminAcc_api_repo = AdminAcc_api_repo();

/* -------------------------------------------------------------------------- */
/*              //! SuperAdmin screen : fetch admin request list              */
/* -------------------------------------------------------------------------- */

    on<SA_Fetch_appliedAdminList_onStartup_Event>((event, emit) async {
      try {
        emit(SA_isAdminTrue_FetchList_Loading_State());

        //! get api : accs with isAdmin=True
        final List fetchAccs_IsAdminTrueList =
            await adminAcc_api_repo.fetchProp_isAdminVerified_false(counter);
        totalList.addAll(fetchAccs_IsAdminTrueList);

        emit(SA_isAdminTrue_FetchList_Loaded_State(totalList));

        //! error
      } catch (e) {
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(SA_isAdminTrue_FetchList_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                //# pagination for : fetch admin request list               */
/* -------------------------------------------------------------------------- */
    //@ pagination
    on<SA_FetchProp_More_onListEnd_Event>((event, emit) async {
      try {
        emit(SA_isAdminTrue_FetchProp_More_Loading_State());
        print('loading state from bloc');
        counter++;
        print('counter is $counter');
        secondList =
            await adminAcc_api_repo.fetchProp_isAdminVerified_false(counter);
        print(secondList);
        if (secondList.isEmpty) {
          emit(SA_isAdminTrue_FetchProp_More_Loaded_ButEmpty_State());
          print('list items exhausted');
        } else if (secondList.isNotEmpty) {
          emit(SA_isAdminTrue_FetchProp_More_Loaded_State(secondList));
          print('reached below newloaded emit from pag bloc');
        }
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(SA_isAdminTrue_FetchProp_More_Error_State(storeErr));
      }
    });

    // on<Xoo_FetchProp_Reset_onRefresh_Event>((event, emit) {
    //   counter = 1;
    //   emit(Xoo_FetchProp_Refreshed_State());
    // });

/* -------------------------------------------------------------------------- */
/*        //! SuperAdmin screen : ACCEPT admin from isAdmin=True list         */
/* -------------------------------------------------------------------------- */

    on<SA_isAdminTrue_Button_Accepted_Event>((event, emit) async {
      emit(SA_isAdminTrue_button_AcceptedOrRejected_Loading_State());

      try {
        //! get api  : update & accept admin
        var response = await adminAcc_api_repo.update_adminAccepted(
            event.modelObjArgToAccept, event.modelObj_Id_Arg);
        emit(SA_isAdminTrue_button_Accepted_State());

        //! error
      } catch (e) {
        emit(SA_isAdminTrue_button_AcceptedOrRejected_Error_State());
      }
    });

/* -------------------------------------------------------------------------- */
/*  //! SuperAdmin screen : REJECT & DELETE ACC admin from isAdmin=True list  */
/* -------------------------------------------------------------------------- */

    on<SA_isAdminTrue_Button_Rejected_Event>((event, emit) async {
      emit(SA_isAdminTrue_button_AcceptedOrRejected_Loading_State());

      try {
        //! Delete APi : delete user/admin account
        var response =
            await adminAcc_api_repo.deleteAdmin_account(event.modelObj_Id_Arg);

        emit(SA_isAdminTrue_button_Rejected_State());

        // //!  remove SP :
        // await account_sp_repo.removeId();
        // await account_sp_repo.removeEmail();
        // await account_sp_repo.removePassword();
        // await account_sp_repo.removeIsAdmin().then((value) {
        //   emit(SA_isAdminTrue_button_Rejected_State());
        // });

        //! error
      } catch (e) {
        emit(SA_isAdminTrue_button_AcceptedOrRejected_Error_State());
      }
    });
  }
}

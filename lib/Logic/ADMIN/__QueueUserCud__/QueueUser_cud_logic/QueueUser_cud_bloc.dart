import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/QueueUser_repo.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';
import '../../../../service_layer/models/QueueUser.dart';
import '../../../../service_layer/services/firebase_helper.dart';
import '../../../../service_layer/services/secret_credentials/Firebase_paths.dart';

part 'QueueUser_cud_event.dart';
part 'QueueUser_cud_state.dart';

class QueueUserCudBloc extends Bloc<QueueUserCudEvent, QueueUserCudState> {
  QueueUserCudBloc() : super(QueueUserCudInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */

    QueueUser_api_repo queueUser_api_repo = QueueUser_api_repo();

/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<QueueUser_create_onButtonPressed_Event>((event, emit) async {
      emit(QueueUser_create_Loading_State());

      try {
        //# from api repo
        var response = await queueUser_api_repo.create(event.modelObjToAdd);

        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        if (response is String) {
          emit(QueueUser_Cant_create_already_exists_State(response));
        } else if (response is QueueUser) {
          //

          // //! firebase start from here
          // var myPath = queueUser_CollPath.doc('${response.id}');
          // await FirebaseHelper.firebaseHelper.set(myPath, response);

          emit(QueueUser_create_Loaded_State());
        }

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(QueueUser_create_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ update                                 */
/* -------------------------------------------------------------------------- */
    on<QueueUser_Update_onButtonPressed_Event>((event, emit) async {
      emit(QueueUser_update_Loading_State());

      try {
        //# from api repo
        var response = await queueUser_api_repo.update(
            event.modelObjToAdd, event.modelObj_id);

        //# from GS repo (NOTE:  if using GS, dont store response in var)
        // await hoo_update_Gs_repo.update_hoo(
        //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

        // //! firebase update
        // var myPath = queueUser_CollPath.doc('${response.id}');
        // await FirebaseHelper.firebaseHelper.update(myPath, response);

        emit(QueueUser_update_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(QueueUser_update_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ delete                                 */
/* -------------------------------------------------------------------------- */
    on<QueueUser_Delete_onButtonPressed_Event>((event, emit) async {
      emit(QueueUser_Delete_Loading_state());

      try {
        //# from api repo
        //! note : api returns string response to delete
        // dont use this stringResponse for logic, just use this to print
        var StringReponse = await queueUser_api_repo.delete(event.modelObj_id);

        //# from Gs repo (NOTE:  if using GS, dont store response in var)
        // await poo_delete_api_repo.delete_poo(event.modelObj_id);

        // //! firebase update
        // var myPath = queueUser_CollPath.doc('${event.modelObj_id}');
        // await FirebaseHelper.firebaseHelper.delete(myPath);

        emit(QueueUser_Delete_Loaded_state());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(QueueUser_Delete_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                   //@ Notify next 5th queueuser by email                   */
/* -------------------------------------------------------------------------- */

    on<QueueUser_Notify_Next5th_queueUserByEmail_Event>((event, emit) async {
      try {
        //# from api repo

        //TODO : Uncomment this later, to send emails ( for now its disabled)
        // it sends email to next 5th person , of deleted people
        var StringReponse = await queueUser_api_repo
            .rawAdd_notifyQU_byEmail(event.queueUserEmail);

        //
        emit(QueueUser_NotifyEmail_SentSuccessfully_state());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
      }
    });
  }
}

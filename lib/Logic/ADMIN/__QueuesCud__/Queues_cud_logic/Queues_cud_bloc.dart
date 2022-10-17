import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/Queues_repo.dart';
import 'package:no_queue2/service_layer/models/Queues.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'Queues_cud_event.dart';
part 'Queues_cud_state.dart';

class QueuesCudBloc extends Bloc<QueuesCudEvent, QueuesCudState> {
  QueuesCudBloc() : super(QueuesCudInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */

    Queues_api_repo queues_api_repo = Queues_api_repo();
/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<Queues_create_onButtonPressed_Event>((event, emit) async {
      emit(Queues_create_Loading_State());

      try {
        //# from api repo
        var response = await queues_api_repo.create(event.modelObjToAdd);

        if (response is String) {
          emit(Queues_CantCreateMorethan5queue_State());
        } else if (response is Queues) {
          emit(Queues_create_Loaded_State());
        }

        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Queues_create_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ update                                 */
/* -------------------------------------------------------------------------- */
    on<Queues_Update_onButtonPressed_Event>((event, emit) async {
      emit(Queues_update_Loading_State());

      try {
        //# from api repo
        var response = await queues_api_repo.update(
            event.modelObjToAdd, event.modelObj_id);

        //# from GS repo (NOTE:  if using GS, dont store response in var)
        // await hoo_update_Gs_repo.update_hoo(
        //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

        emit(Queues_update_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Queues_update_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ delete                                 */
/* -------------------------------------------------------------------------- */
    on<Queues_Delete_onButtonPressed_Event>((event, emit) async {
      emit(Queues_Delete_Loading_state());

      try {
        //# from api repo
        //! note : api returns string response to delete
        // dont use this stringResponse for logic, just use this to print
        var StringReponse = await queues_api_repo.delete(event.modelObj_id);

        //# from Gs repo (NOTE:  if using GS, dont store response in var)
        // await poo_delete_api_repo.delete_poo(event.modelObj_id);

        emit(Queues_Delete_Loaded_state());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Queues_Delete_Error_State(storeErr));
      }
    });
  }
}

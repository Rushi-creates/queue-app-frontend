import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/AdminAcc_repo.dart';
import 'package:no_queue2/Repository_layer/Queues_repo.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';
import '../../../../service_layer/models/AdminAcc.dart';

part 'Queues_fetch_event.dart';
part 'Queues_fetch_state.dart';

class QueuesFetchBloc extends Bloc<QueuesFetchEvent, QueuesFetchState> {
  int newCounter = 0;
  List newList = [];

  QueuesFetchBloc() : super(QueuesFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    Queues_api_repo queues_api_repo = Queues_api_repo();
    AdminAcc_sp_repo adminAcc_sp_repo = AdminAcc_sp_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<Queues_Fetch_onInit_Event>((event, emit) async {
      emit(Queues_Fetch_Loading_State(newList));
      try {
        print('on init called');

        //!  get SP : admin id from sp
        AdminAcc adminObj = await adminAcc_sp_repo.spGet_AdminAccObj()!;
        int storeId = adminObj.id!;

        //# incr counter
        newCounter++;

        //# calling api
        // Todo : select one ( fetch all or fetch prop)
        final List moreFetchedList = await queues_api_repo
            .fetchProp_searchBy_AdminAccFk(newCounter, storeId);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(Queues_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(Queues_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Queues_Fetch_Error_State(storeErr, newList));
      }
    });

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/*                   //  fetch + , from diff profile                          */
/* -------------------------------------------------------------------------- */

    on<Queues_Fetch_onInit_fromDiffProfile_Event>((event, emit) async {
      try {
        emit(Queues_Fetch_Loading_State(newList));

        // Timer.periodic(Duration(seconds: 3), (timer) {
        //   if (timer == 3) {
        //     emit(Queues_Fetch_LoadingTimeOut_State(newList));
        //   }
        // });

        // await Future.delayed(Duration(seconds: 4));

        //# incr counter
        newCounter++;

        //# calling api
        // Todo : select one ( fetch all or fetch prop)
        final List moreFetchedList = await queues_api_repo
            .fetchProp_searchBy_AdminAccFk(newCounter, event.adminAcc_fk);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(Queues_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(Queues_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Queues_Fetch_Error_State(storeErr, newList));
      }
    });

    on<Queues_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}

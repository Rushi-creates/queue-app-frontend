import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/QueueUser_repo.dart';
import 'package:no_queue2/Repository_layer/UserAcc_repo.dart';
import 'package:no_queue2/service_layer/models/UserAcc.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'CurrentQueues_fetch_event.dart';
part 'CurrentQueues_fetch_state.dart';

class CurrentQueuesFetchBloc
    extends Bloc<CurrentQueuesFetchEvent, CurrentQueuesFetchState> {
  int newCounter = 0;
  List newList = [];

  CurrentQueuesFetchBloc() : super(CurrentQueuesFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */

    QueueUser_api_repo queueUser_api_repo = QueueUser_api_repo();

    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<CurrentQueues_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(CurrentQueues_Fetch_Loading_State(newList));

        //# incr counter
        newCounter++;

        //!  get SP : admin id from sp
        UserAcc userObj = await userAcc_sp_repo.spGet_UserAccObj()!;
        int storeId = userObj.id!;

        //# calling api
        //Todo : select one ( fetch all or fetch prop)
        print('%%%%%%%%%%%  = > $newCounter');
        var moreFetchedList = await queueUser_api_repo
            .fetchProp_currentQueues_by_userAcc_fk(newCounter, storeId);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);
        print(moreFetchedList.toString());

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(CurrentQueues_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(CurrentQueues_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print('inside bloc catch ');
        print(e);
        print(e.runtimeType);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(CurrentQueues_Fetch_Error_State(storeErr, newList));
      }
    });

    on<CurrentQueues_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}

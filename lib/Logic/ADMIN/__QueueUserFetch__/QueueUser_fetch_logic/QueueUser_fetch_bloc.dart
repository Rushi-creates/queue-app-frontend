import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/QueueUser_repo.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'QueueUser_fetch_event.dart';
part 'QueueUser_fetch_state.dart';

class QueueUserFetchBloc
    extends Bloc<QueueUserFetchEvent, QueueUserFetchState> {
  int newCounter = 0;
  List newList = [];

  QueueUserFetchBloc() : super(QueueUserFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */

    QueueUser_api_repo queueUser_api_repo = QueueUser_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<QueueUser_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(QueueUser_Fetch_Loading_State(newList));

        //# incr counter
        newCounter++;

        //# calling api
        //Todo : select one ( fetch all or fetch prop)
        final List moreFetchedList = await queueUser_api_repo
            .fetchProp_andSearchBy_queue_fk(newCounter, event.queue_uid);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(QueueUser_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(QueueUser_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(QueueUser_Fetch_Error_State(storeErr, newList));
      }
    });

    on<QueueUser_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}

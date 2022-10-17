import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/AdminAcc_repo.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'SearchAdmin_fetch_event.dart';
part 'SearchAdmin_fetch_state.dart';

class SearchAdminFetchBloc
    extends Bloc<SearchAdminFetchEvent, SearchAdminFetchState> {
  int newCounter = 0;
  List newList = [];

  SearchAdminFetchBloc() : super(SearchAdminFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    AdminAcc_api_repo adminAcc_api_repo = AdminAcc_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<SearchAdmin_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(SearchAdmin_Fetch_Loading_State(newList));

        //# incr counter
        newCounter++;

        //# calling api
        //TODO : select one ( fetch all or fetch prop)
        final List moreFetchedList = await adminAcc_api_repo
            .fetchProp_isAdminVerifiedAndSearchByCompanyName(
                newCounter, event.searchAdminController);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(SearchAdmin_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(SearchAdmin_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(SearchAdmin_Fetch_Error_State(storeErr, newList));
      }
    });

    on<SearchAdmin_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}

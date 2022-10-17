import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/Queues_repo.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'queues_fetch_id_event.dart';
part 'queues_fetch_id_state.dart';

class QueuesFetchIdBloc extends Bloc<QueuesFetchIdEvent, QueuesFetchIdState> {
  QueuesFetchIdBloc() : super(QueuesFetchIdInitial()) {
    /* -------------------------------------------------------------------------- */
/*                             //@ repo class objs                            */
/* -------------------------------------------------------------------------- */
    Queues_api_repo queues_api_repo = Queues_api_repo();

/* -------------------------------------------------------------------------- */
/*                           //@ fetch single by id                           */
/* -------------------------------------------------------------------------- */
    on<Queues_FetchById_onButtonPressed_Event>((event, emit) async {
      try {
        emit(Queues_FetchById_Loading_State());

        //# from api repo class
        final response = await queues_api_repo.fetchById(event.id);

        //# from GS repo class  ( uncomment if using gs )
        // final response = await queues_Gs_Repo.fetchById_queues(event.id);
        emit(Queues_FetchById_Loaded_State(response));

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Queues_FetchById_Error_State(storeErr));
      }
    });
  }
}

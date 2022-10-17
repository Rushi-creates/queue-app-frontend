import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/Queues_repo.dart';

import '../../../../service_layer/Exceptions/Exceptions.dart';

part 'Queue_fetch_id_event.dart';
part 'Queue_fetch_id_state.dart';

class QueueFetchIdBloc extends Bloc<QueueFetchIdEvent, QueueFetchIdState> {
  QueueFetchIdBloc() : super(QueueFetchIdInitial()) {
    /* -------------------------------------------------------------------------- */
/*                             //@ repo class objs                            */
/* -------------------------------------------------------------------------- */
    // Queue_Api_Repo Queue_Api_Repo = Queue_Api_Repo();
    // Queue_Gs_Repo Queue_Gs_Repo = Queue_Gs_Repo();
    Queues_api_repo queues_api_repo = Queues_api_repo();

/* -------------------------------------------------------------------------- */
/*                           //@ fetch single by id                           */
/* -------------------------------------------------------------------------- */
    on<Queue_FetchById_onButtonPressed_Event>((event, emit) async {
      try {
        emit(Queue_FetchById_Loading_State());

        //# from api repo class
        final response = await queues_api_repo.fetchById(event.id);

        //# from GS repo class  ( uncomment if using gs )
        // final response = await Queue_Gs_Repo.fetchById_Queue(event.id);
        emit(Queue_FetchById_Loaded_State(response));

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Queue_FetchById_Error_State(storeErr));
      }
    });
  }
}

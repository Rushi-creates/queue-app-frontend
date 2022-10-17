import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_queue2/Repository_layer/UserAcc_repo.dart';
import 'package:no_queue2/service_layer/models/UserAcc.dart';

part 'cache_provider_event.dart';
part 'cache_provider_state.dart';

class CacheProviderBloc extends Bloc<CacheProviderEvent, CacheProviderState> {
  CacheProviderBloc() : super(CacheProviderInitial()) {
    //

    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();

    // on<Cache_userAccObj_Store_Event>((event, emit) async {
    //   await userAcc_sp_repo.spStore_UserAccObj();
    // });

    on<Cache_userAccObj_Get_Event>((event, emit) async {
      UserAcc userObj = await userAcc_sp_repo.spGet_UserAccObj();
      emit(cache_userAccObj_Got_State(userObj));
    });
  }
}

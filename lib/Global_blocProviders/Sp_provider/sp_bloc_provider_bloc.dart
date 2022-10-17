import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sp_bloc_provider_event.dart';
part 'sp_bloc_provider_state.dart';

class SpBlocProviderBloc
    extends Bloc<SpBlocProviderEvent, SpBlocProviderState> {
  var sp_userAccObj = null; // my state
  var sp_adminAccObj = null; // my state

  SpBlocProviderBloc() : super(SpBlocProviderInitial()) {
/* -------------------------------------------------------------------------- */
/*                                  //@ User                                  */
/* -------------------------------------------------------------------------- */

    on<sp_userAccObj_Store_Event>((event, emit) {
      sp_userAccObj = event.userObj;
      emit(Sp_userAccObj_Stored_State());
    });

    on<sp_userAccObj_Get_Event>(
        (event, emit) => emit(Sp_userAccObj_Got_State(sp_userAccObj)));

    on<sp_userAccObj_Remove_Event>((event, emit) {
      sp_userAccObj = null;
      emit(Sp_userAccObj_Removed_State());
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ admin                                  */
/* -------------------------------------------------------------------------- */
    on<sp_adminAccObj_Store_Event>((event, emit) {
      sp_adminAccObj = event.adminObj;
      emit(Sp_adminAccObj_Stored_State());
    });

    on<sp_adminAccObj_Get_Event>(
        (event, emit) => emit(Sp_adminAccObj_Got_State(sp_adminAccObj)));

    on<sp_adminAccObj_Remove_Event>((event, emit) {
      sp_adminAccObj = null;
      emit(Sp_adminAccObj_Removed_State());
    });
  }
}

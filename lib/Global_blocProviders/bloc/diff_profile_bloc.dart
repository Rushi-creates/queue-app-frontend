import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'diff_profile_event.dart';
part 'diff_profile_state.dart';

class DiffProfileBloc extends Bloc<DiffProfileEvent, DiffProfileState> {
  var diffProfObj = null; // my state

  DiffProfileBloc() : super(DiffProfileInitial()) {
    on<diffProfile_Store_Event>((event, emit) {
      diffProfObj = event.profArg;
      emit(DiffProfile_Stored_State());
    });

    on<diffProfile_Get_Event>(
        (event, emit) => emit(DiffProfile_Got_State(diffProfObj)));

    on<diffProfile_Remove_Event>((event, emit) {
      diffProfObj = null;
      emit(DiffProfile_Removed_State());
    });
  }
}

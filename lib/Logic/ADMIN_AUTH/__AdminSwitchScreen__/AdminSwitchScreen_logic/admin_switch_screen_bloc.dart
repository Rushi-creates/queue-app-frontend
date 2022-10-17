import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_switch_screen_event.dart';
part 'admin_switch_screen_state.dart';

class AdminSwitchScreenBloc
    extends Bloc<AdminSwitchScreenEvent, AdminSwitchScreenState> {
  AdminSwitchScreenBloc() : super(AdminSwitchScreenInitial()) {
    //
    on<SwitchToLogin_Event>((event, emit) => emit(SwitchedToLogin_State()));

    //
    on<SwitchToRegister_Event>(
        (event, emit) => emit(SwitchedToRegister_State()));
  }
}

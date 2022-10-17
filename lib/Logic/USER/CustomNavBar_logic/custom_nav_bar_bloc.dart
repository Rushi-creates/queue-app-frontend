import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'custom_nav_bar_event.dart';
part 'custom_nav_bar_state.dart';

class CustomNavBarBloc extends Bloc<CustomNavBarEvent, CustomNavBarState> {
  CustomNavBarBloc() : super(CustomNavBarInitial()) {
    on<CustomNavbar_HomeCLicked_Event>(
        (event, emit) => emit(CustomNaBar_openHome_State()));

    on<CustomNavbar_SearchCLicked_Event>(
        (event, emit) => emit(CustomNaBar_openSearch_State()));
  }
}

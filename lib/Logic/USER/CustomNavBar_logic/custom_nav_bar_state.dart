part of 'custom_nav_bar_bloc.dart';

abstract class CustomNavBarState extends Equatable {
  const CustomNavBarState();

  @override
  List<Object> get props => [];
}

class CustomNavBarInitial extends CustomNavBarState {}

class CustomNaBar_openHome_State extends CustomNavBarState {}

class CustomNaBar_openSearch_State extends CustomNavBarState {}

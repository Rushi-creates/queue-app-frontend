part of 'custom_nav_bar_bloc.dart';

abstract class CustomNavBarEvent extends Equatable {
  const CustomNavBarEvent();

  @override
  List<Object> get props => [];
}

class CustomNavbar_HomeCLicked_Event extends CustomNavBarEvent {}

class CustomNavbar_SearchCLicked_Event extends CustomNavBarEvent {}

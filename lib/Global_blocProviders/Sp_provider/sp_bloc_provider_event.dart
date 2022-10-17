part of 'sp_bloc_provider_bloc.dart';

abstract class SpBlocProviderEvent extends Equatable {
  const SpBlocProviderEvent();

  @override
  List<Object> get props => [];
}

//user
class sp_userAccObj_Store_Event extends SpBlocProviderEvent {
  final userObj;

  sp_userAccObj_Store_Event(this.userObj);

  @override
  List<Object> get props => [userObj];
}

class sp_userAccObj_Get_Event extends SpBlocProviderEvent {}

class sp_userAccObj_Remove_Event extends SpBlocProviderEvent {}

//admin
class sp_adminAccObj_Store_Event extends SpBlocProviderEvent {
  final adminObj;

  sp_adminAccObj_Store_Event(this.adminObj);

  @override
  List<Object> get props => [adminObj];
}

class sp_adminAccObj_Get_Event extends SpBlocProviderEvent {}

class sp_adminAccObj_Remove_Event extends SpBlocProviderEvent {}

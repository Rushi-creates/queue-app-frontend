part of 'sp_bloc_provider_bloc.dart';

abstract class SpBlocProviderState extends Equatable {
  const SpBlocProviderState();

  @override
  List<Object> get props => [];
}

class SpBlocProviderInitial extends SpBlocProviderState {}

/* -------------------------------------------------------------------------- */
/*                                //@ User                                    */
/* -------------------------------------------------------------------------- */
class Sp_userAccObj_Stored_State extends SpBlocProviderState {}

class Sp_userAccObj_Got_State extends SpBlocProviderState {
  final sp_userAccObj;
  Sp_userAccObj_Got_State(this.sp_userAccObj);
  @override
  List<Object> get props => [sp_userAccObj];
}

class Sp_userAccObj_Removed_State extends SpBlocProviderState {}

/* -------------------------------------------------------------------------- */
/*                                  //@ admin                                 */
/* -------------------------------------------------------------------------- */
class Sp_adminAccObj_Stored_State extends SpBlocProviderState {}

class Sp_adminAccObj_Got_State extends SpBlocProviderState {
  final sp_adminAccObj;
  Sp_adminAccObj_Got_State(this.sp_adminAccObj);
  @override
  List<Object> get props => [sp_adminAccObj];
}

class Sp_adminAccObj_Removed_State extends SpBlocProviderState {}

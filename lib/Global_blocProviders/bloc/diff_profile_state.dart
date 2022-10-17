part of 'diff_profile_bloc.dart';

abstract class DiffProfileState extends Equatable {
  const DiffProfileState();

  @override
  List<Object> get props => [];
}

class DiffProfileInitial extends DiffProfileState {}

class DiffProfile_Stored_State extends DiffProfileState {}

class DiffProfile_Got_State extends DiffProfileState {
  final diffProfile_Obj;
  DiffProfile_Got_State(this.diffProfile_Obj);
  @override
  List<Object> get props => [diffProfile_Obj];
}

class DiffProfile_Removed_State extends DiffProfileState {}

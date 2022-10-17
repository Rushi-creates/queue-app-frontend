part of 'diff_profile_bloc.dart';

abstract class DiffProfileEvent extends Equatable {
  const DiffProfileEvent();

  @override
  List<Object> get props => [];
}

class diffProfile_Store_Event extends DiffProfileEvent {
  final profArg;

  diffProfile_Store_Event(this.profArg);

  @override
  List<Object> get props => [profArg];
}

class diffProfile_Get_Event extends DiffProfileEvent {}

class diffProfile_Remove_Event extends DiffProfileEvent {}

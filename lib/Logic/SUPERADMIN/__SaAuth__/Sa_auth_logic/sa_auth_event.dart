part of 'sa_auth_bloc.dart';

abstract class SaAuthEvent extends Equatable {
  const SaAuthEvent();

  @override
  List<Object> get props => [];
}

class CheckSa_ButtonCLicked_Event extends SaAuthEvent {
  final modelObj;

  CheckSa_ButtonCLicked_Event(this.modelObj);

  @override
  List<Object> get props => [modelObj];
}

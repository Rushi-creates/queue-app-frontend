part of 'admin_verify_bloc.dart';

abstract class AdminVerifyEvent extends Equatable {
  const AdminVerifyEvent();

  @override
  List<Object> get props => [];
}

//! Admin events
class IsAdmin_verify_checkOnStartup_Event extends AdminVerifyEvent {
  IsAdmin_verify_checkOnStartup_Event();
}

class IsAdmin_verify_checkOnStartup_fromDiffProfile_Event
    extends AdminVerifyEvent {
  final profileID;
  IsAdmin_verify_checkOnStartup_fromDiffProfile_Event(this.profileID);

  @override
  List<Object> get props => [profileID];
}

part of 'admin_request_list_bloc.dart';

abstract class AdminRequestListEvent extends Equatable {
  const AdminRequestListEvent();

  @override
  List<Object> get props => [];
}

//! Super Admin events

class SA_Fetch_appliedAdminList_onStartup_Event extends AdminRequestListEvent {}

//#  pagination
class SA_FetchProp_More_onListEnd_Event extends AdminRequestListEvent {}

// class Xoo_FetchProp_Reset_onRefresh_Event extends XooFetchPropEvent {}

//! accept / reject events
class SA_isAdminTrue_Button_Accepted_Event extends AdminRequestListEvent {
  final modelObjArgToAccept;
  final modelObj_Id_Arg;
  SA_isAdminTrue_Button_Accepted_Event(
      this.modelObjArgToAccept, this.modelObj_Id_Arg);
}

class SA_isAdminTrue_Button_Rejected_Event extends AdminRequestListEvent {
  final modelObj_Id_Arg;
  SA_isAdminTrue_Button_Rejected_Event(this.modelObj_Id_Arg);
}

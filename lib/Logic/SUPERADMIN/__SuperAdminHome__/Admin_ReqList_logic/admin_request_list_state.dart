part of 'admin_request_list_bloc.dart';

abstract class AdminRequestListState extends Equatable {
  const AdminRequestListState();

  @override
  List<Object> get props => [];
}

class AdminRequestListInitial extends AdminRequestListState {}

//! SuperAdmin Fetchlist for  applied admin screen states

class SA_isAdminTrue_FetchList_Loading_State extends AdminRequestListState {}

class SA_isAdminTrue_FetchList_Error_State extends AdminRequestListState {
  final error;

  SA_isAdminTrue_FetchList_Error_State(this.error);
}

class SA_isAdminTrue_FetchList_Loaded_State extends AdminRequestListState {
  final appliedAdminList;

  SA_isAdminTrue_FetchList_Loaded_State(this.appliedAdminList);

  @override
  List<Object> get props => [appliedAdminList];
}

//!  pagination for fetchList states
//# pagination

class SA_isAdminTrue_FetchProp_More_Loading_State
    extends AdminRequestListState {}

class SA_isAdminTrue_FetchProp_More_Loaded_State extends AdminRequestListState {
  final moreModelObjList;
  SA_isAdminTrue_FetchProp_More_Loaded_State(this.moreModelObjList);

  @override
  List<Object> get props => [moreModelObjList];
}

class SA_isAdminTrue_FetchProp_More_Error_State extends AdminRequestListState {
  final error;
  SA_isAdminTrue_FetchProp_More_Error_State(this.error);
}

class SA_isAdminTrue_FetchProp_More_Loaded_ButEmpty_State
    extends AdminRequestListState {}

// class SA_isAdminTrue_FetchProp_Refreshed_State extends AdminRequestListState {}

//! super Admin  accept/ reject button events
class SA_isAdminTrue_button_AcceptedOrRejected_Loading_State
    extends AdminRequestListState {}

class SA_isAdminTrue_button_AcceptedOrRejected_Error_State
    extends AdminRequestListState {}

class SA_isAdminTrue_button_Accepted_State extends AdminRequestListState {}

class SA_isAdminTrue_button_Rejected_State extends AdminRequestListState {}

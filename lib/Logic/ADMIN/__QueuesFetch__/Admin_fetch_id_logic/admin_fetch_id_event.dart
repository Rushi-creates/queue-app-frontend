part of 'admin_fetch_id_bloc.dart';

abstract class AdminFetchIdEvent extends Equatable {
  const AdminFetchIdEvent();

  @override
  List<Object> get props => [];
}

class Admin_FetchById_onButtonPressed_Event extends AdminFetchIdEvent {
  final id;

  Admin_FetchById_onButtonPressed_Event(this.id);

  @override
  List<Object> get props => [id];
}

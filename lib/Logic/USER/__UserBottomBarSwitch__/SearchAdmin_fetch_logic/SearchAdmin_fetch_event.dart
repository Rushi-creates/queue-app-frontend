part of 'SearchAdmin_fetch_bloc.dart';

abstract class SearchAdminFetchEvent extends Equatable {
  const SearchAdminFetchEvent();

  @override
  List<Object> get props => [];
}

class SearchAdmin_Fetch_onInit_Event extends SearchAdminFetchEvent {
  final searchAdminController;

  SearchAdmin_Fetch_onInit_Event(this.searchAdminController);
}

class SearchAdmin_Fetch_onRefresh_Event extends SearchAdminFetchEvent {}

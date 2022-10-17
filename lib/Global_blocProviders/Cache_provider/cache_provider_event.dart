part of 'cache_provider_bloc.dart';

abstract class CacheProviderEvent extends Equatable {
  const CacheProviderEvent();

  @override
  List<Object> get props => [];
}

//user
// class Cache_userAccObj_Store_Event extends CacheProviderEvent {}

class Cache_userAccObj_Get_Event extends CacheProviderEvent {}

// class Cache_userAccObj_Remove_Event extends CacheProviderEvent {}

//admin
// class Cache_adminAccObj_Store_Event extends CacheProviderEvent {}

class Cache_adminAccObj_Get_Event extends CacheProviderEvent {}

// class Cache_adminAccObj_Remove_Event extends CacheProviderEvent {}

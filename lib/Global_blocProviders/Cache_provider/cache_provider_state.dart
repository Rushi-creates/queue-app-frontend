part of 'cache_provider_bloc.dart';

abstract class CacheProviderState extends Equatable {
  const CacheProviderState();

  @override
  List<Object> get props => [];
}

class CacheProviderInitial extends CacheProviderState {}

/* -------------------------------------------------------------------------- */
/*                                //@ User                                    */
/* -------------------------------------------------------------------------- */
// class cache_userAccObj_Stored_State extends CacheProviderState {}

class cache_userAccObj_Got_State extends CacheProviderState {
  final cache_userAccObj;
  cache_userAccObj_Got_State(this.cache_userAccObj);
  @override
  List<Object> get props => [cache_userAccObj];
}

// class cache_userAccObj_Removed_State extends CacheProviderState {}

/* -------------------------------------------------------------------------- */
/*                                  //@ admin                                 */
/* -------------------------------------------------------------------------- */
// class cache_adminAccObj_Stored_State extends CacheProviderState {}

class cache_adminAccObj_Got_State extends CacheProviderState {
  final cache_adminAccObj;
  cache_adminAccObj_Got_State(this.cache_adminAccObj);
  @override
  List<Object> get props => [cache_adminAccObj];
}

// class cache_adminAccObj_Removed_State extends CacheProviderState {}

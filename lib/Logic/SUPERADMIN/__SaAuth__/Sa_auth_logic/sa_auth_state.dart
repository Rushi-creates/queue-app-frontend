part of 'sa_auth_bloc.dart';

abstract class SaAuthState extends Equatable {
  const SaAuthState();

  @override
  List<Object> get props => [];
}

class SaAuthInitial extends SaAuthState {}

class SA_auth_LoadingState extends SaAuthState {}

class SA_auth_SuperString_NOT_matched_State extends SaAuthState {}

class SA_auth_SuperString_Matched_Success_State extends SaAuthState {}

class SA_auth_UnknownError_State extends SaAuthState {
  final error;
  SA_auth_UnknownError_State(this.error);
  @override
  List<Object> get props => [error];
}

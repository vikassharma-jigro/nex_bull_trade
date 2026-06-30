import 'package:equatable/equatable.dart';

import '../../../model/auth_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;

  const AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final UserModel? error;

  const AuthError(this.error);

  @override
  List<Object?> get props => [error];
}

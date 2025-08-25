/*
  Different kinds of states
*/

import 'package:insta_clone/features/authentication/domain/entities/app_auth.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class Unauthenticated extends AuthStates {}

class Authenticated extends AuthStates {
  final AppUser user;
  Authenticated(this.user);
}

class AuthError extends AuthStates {
  final String message;
  AuthError(this.message);
}

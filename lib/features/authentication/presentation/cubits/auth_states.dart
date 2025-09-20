/*
  Different kinds of states
*/

import 'package:insta_clone/features/authentication/domain/entities/app_auth.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

// authentication states

class AuthLoading extends AuthStates {}

class Unauthenticated extends AuthStates {}

class Authenticated extends AuthStates {
  final AppUser user;
  Authenticated(this.user);
}

// toggle page

class TogglePage extends AuthStates {
  final bool isSignInPage;
  TogglePage(this.isSignInPage);
}

class AuthError extends AuthStates {
  final String message;
  AuthError(this.message);
}

/*
 Auth Repo -> Outline the possible auth operations for this app 
 */

import 'package:insta_clone/features/authentication/domain/entities/app_auth.dart';

abstract class AuthRepo {
  Future<AppUser?> signInWithEmailPassword(String email, password);

  Future<AppUser?> createUserWithEmailPassword(String name, email, password);

  Future<void> signOut();

  Future<AppUser?> getCurrentUser();
}

/*
 Profile Repo -> Outline the possible profile operations for this app 
 */

import 'package:insta_clone/features/profile/domain/entities/profile_user.dart';

abstract class ProfileRepo {
  Future<ProfileUser?> fetchUserProfile(String uid);
  Future<void> updateProfile(ProfileUser updateProfile);
}

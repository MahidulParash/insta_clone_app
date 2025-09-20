import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/features/profile/domain/entities/profile_user.dart';
import 'package:insta_clone/features/profile/domain/repositories/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  // fetch user profile using repo
  Future<void> fetchUserProfile(String uid) async {
    try {
      emit(ProfileLoading());
      final user = await profileRepo.fetchUserProfile(uid);

      if (user != null) {
        emit(ProfileLoaded(profileUser: user));
      } else {
        emit(ProfileError(error: "User not found"));
      }
    } catch (e) {
      emit(ProfileError(error: "User not found"));
    }
  }

  // upadte bio/profile picture
  Future<void> updateProfile({required String uid, String? newBio}) async {
    emit(ProfileLoading());
    try {
      // fetch current profile first
      final currentUser = await profileRepo.fetchUserProfile(uid);
      if (currentUser == null) {
        emit(ProfileError(error: "Failed to fetch user for update"));
        return;
      }

      // update profile pic

      //update bio
      final updatedProfile = currentUser.copyWith(
        newBio: newBio ?? currentUser.bio,
      );

      // update repo
      await profileRepo.updateProfile(updatedProfile);

      // refetch profile
      await fetchUserProfile(uid);
    } catch (e) {
      emit(ProfileError(error: "Failed to update user: $e"));
    }
  }
}

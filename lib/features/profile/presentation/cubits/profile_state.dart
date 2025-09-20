part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileUser profileUser;

  ProfileLoaded({required this.profileUser});
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}

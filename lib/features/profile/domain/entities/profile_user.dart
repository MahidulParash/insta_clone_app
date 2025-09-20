import 'package:insta_clone/features/authentication/domain/entities/app_auth.dart';

class ProfileUser extends AppUser {
  final String bio;
  final String profileImageUrl;

  ProfileUser({
    required this.bio,
    required this.profileImageUrl,
    required super.uid,
    required super.email,
    required super.name,
  });

  // method to update user
  ProfileUser copyWith({String? newBio, String? newProfileImageUrl}) {
    return ProfileUser(
      bio: newBio ?? bio,
      profileImageUrl: newProfileImageUrl ?? bio,
      uid: uid,
      email: email,
      name: name,
    );
  }

  // convert profile user -> json
  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
    };
  }

  // convert json -> profile user
  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      bio: json['bio'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
    );
  }
}

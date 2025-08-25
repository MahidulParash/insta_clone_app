import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/features/authentication/domain/entities/app_auth.dart';
import 'package:insta_clone/features/authentication/domain/repositories/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    // get current user
    final firebaseUser = firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return null;
    } else {
      return AppUser(
        uid: firebaseUser.uid,
        email: firebaseUser.email!,
        name: '',
      );
    }
  }

  @override
  Future<AppUser?> signInWithEmailPassword(String email, password) async {
    try {
      // attempt signing in
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: '',
      );

      return user;
    } catch (e) {
      throw Exception("SignIn Failed: $e");
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> createUserWithEmailPassword(
    String name,
    email,
    password,
  ) async {
    try {
      // attempt create user
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );

      return user;
    } catch (e) {
      throw Exception("Create User Failed: $e");
    }
  }
}

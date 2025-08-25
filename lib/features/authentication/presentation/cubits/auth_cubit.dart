import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/features/authentication/domain/entities/app_auth.dart';
import 'package:insta_clone/features/authentication/domain/repositories/auth_repo.dart';
import 'package:insta_clone/features/authentication/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;

  AppUser? currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // check if user is already authenticated
  Future<void> checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null) {
      currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  // getter for current user

  AppUser? get user => currentUser;

  // sign in w/ email and pass

  Future<void> signIn(String email, password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.signInWithEmailPassword(email, password);

      if (user != null) {
        currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  //  create user w/ email and pass

  Future<void> signUp(String name, email, password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.createUserWithEmailPassword(
        name,
        email,
        password,
      );

      if (user != null) {
        currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  // sign out

  Future<void> signOut() async {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}

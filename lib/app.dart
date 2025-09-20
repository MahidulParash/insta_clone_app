import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/features/authentication/data/firebase_auth_repo.dart';
import 'package:insta_clone/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:insta_clone/features/authentication/presentation/cubits/auth_states.dart';
import 'package:insta_clone/features/authentication/presentation/pages/auth_page.dart';
import 'package:insta_clone/features/home/presentation/pages/home_page.dart';
import 'package:insta_clone/config/themes/light_mode.dart';

/*    init repos for db
       - firebase
      bloc providers for state management
       - auth
       - profile
       - post
       - search
       - theme
      check auth check
       - uthauthorized -> auth page
       - authenticated -> home page
*/
class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthStates>(
          // listen for error
          listener: (context, authState) {
            if (authState is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(authState.message)));
            }
          },
          builder: (context, authState) {
            log(authState.toString());
            if (authState is Unauthenticated) {
              return const AuthPage();
            }
            if (authState is Authenticated) {
              return const HomePage();
            }
            // loading
            else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ), //! edit it to be a custom loader later
              );
            }
          },
        ),
      ),
    );
  }
}

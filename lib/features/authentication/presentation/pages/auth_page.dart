import 'package:flutter/material.dart';
import 'package:insta_clone/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:insta_clone/features/authentication/presentation/pages/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially, show sign in page
  bool showSignInPage = true;
  // toggle between pages
  void togglePages() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignInPage(togglePage: togglePages);
    } else {
      return SignUpPage(togglePage: togglePages);
    }
  }
}

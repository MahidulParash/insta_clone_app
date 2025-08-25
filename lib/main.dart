import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/features/authentication/presentation/pages/login_page.dart';
import 'package:insta_clone/features/authentication/themes/light_mode.dart';
import 'package:insta_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: LoginPage(),
    );
  }
}

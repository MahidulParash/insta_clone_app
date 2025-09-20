import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/app.dart';
import 'package:insta_clone/config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

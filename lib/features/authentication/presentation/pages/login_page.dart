import 'package:flutter/material.dart';
import 'package:insta_clone/features/authentication/presentation/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final passController = TextEditingController();

  //form keys
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                // center logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 50),
                // welcome msg
                Text(
                  "Welcome back, you've been missed",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                //email inputfield
                CustomTextField(
                  formKey: emailKey,
                  controller: emailController,
                  hintText: "Enter Email",
                ),
                const SizedBox(height: 25),
                //password inputfield
                CustomTextField(
                  formKey: passKey,
                  controller: passController,
                  hintText: "Enter Password",
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

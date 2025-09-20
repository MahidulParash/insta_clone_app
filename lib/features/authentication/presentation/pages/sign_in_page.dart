import 'package:flutter/material.dart';
import 'package:insta_clone/features/authentication/presentation/components/submit_button.dart';
import 'package:insta_clone/features/authentication/presentation/components/text_field.dart';
import 'package:insta_clone/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  final void Function()? togglePage;
  const SignInPage({super.key, required this.togglePage});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // text controllers
  final emailController = TextEditingController();
  final passController = TextEditingController();

  //form keys
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();

  // sign in button action
  void signIn() {
    final String email = emailController.text;
    final String pass = passController.text;
    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty && pass.isNotEmpty) {
      authCubit.signIn(email, pass);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both email and password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            //! fix scrolling issue
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(height: 10),
                //password inputfield
                CustomTextField(
                  formKey: passKey,
                  controller: passController,
                  hintText: "Enter Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                //button
                CustomButton(text: "Sign In", onTap: signIn),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(width: 6),
                    GestureDetector(
                      onTap: widget.togglePage,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/features/authentication/presentation/components/submit_button.dart';
import 'package:insta_clone/features/authentication/presentation/components/text_field.dart';
import 'package:insta_clone/features/authentication/presentation/cubits/auth_cubit.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? togglePage;
  const SignUpPage({super.key, required this.togglePage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  //form keys
  final nameKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();
  final confirmPassKey = GlobalKey<FormState>();

  signUp() {
    String name = nameController.text;
    String email = emailController.text;
    String pass = passController.text;
    String confirmPass = confirmPassController.text;

    final authCubit = context.read<AuthCubit>();

    if (nameKey.currentState!.validate() &&
        emailKey.currentState!.validate() &&
        passKey.currentState!.validate()) {
      if (pass == confirmPass) {
        authCubit.signUp(name, email, pass); //! named parameter
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Invalid entries")));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  "Let's create an account for you",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                //name inputfield
                CustomTextField(
                  controller: nameController,
                  formKey: nameKey,
                  hintText: "Enter Name",
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                //confirm password inputfield
                CustomTextField(
                  formKey: confirmPassKey,
                  controller: confirmPassController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                //button
                CustomButton(text: "Sign Up", onTap: signUp),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(width: 6),
                    GestureDetector(
                      onTap: widget.togglePage,
                      child: Text(
                        "Sign In",
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

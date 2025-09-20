import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    required this.formKey,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'This field can\'t be empty';
              }
              return null;
            },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14,
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          //border unselected
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(12),
          ),

          //border selected
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),

          //border error
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final bool isPrimary;
  final bool isActive;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isPrimary = true,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.tertiary,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isActive ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}

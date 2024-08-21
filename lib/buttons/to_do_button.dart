import 'package:bored/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ToDoButton extends ConsumerWidget {
  const ToDoButton({required this.label, required this.onPressed, this.icon, super.key});

  final String label;
  final Function() onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(
          AppColors.backgroundButtonColor,
        ),
        shadowColor: const WidgetStatePropertyAll(Colors.black),
        elevation: const WidgetStatePropertyAll(20.0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      label: Text(
        label,
        style: mainTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

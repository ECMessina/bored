import 'package:bored/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ToDoButton extends ConsumerWidget {
  const ToDoButton({required this.onPressed, super.key});

  final Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
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
      child: Text(
        'Find me something \nto do!',
        style: mainTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

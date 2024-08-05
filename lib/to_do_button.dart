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
        backgroundColor: const MaterialStatePropertyAll(
          AppColors.backgroundButtonColor,
        ),
        shadowColor: const MaterialStatePropertyAll(Colors.black),
        elevation: const MaterialStatePropertyAll(20.0),
        shape: MaterialStatePropertyAll(
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

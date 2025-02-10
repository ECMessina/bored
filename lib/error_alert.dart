import 'package:bored/constants.dart';
import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({
    super.key,
    required this.error,
    required this.onPressed,
  });

  final Object error;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundButtonColor,
      title: Text(
        '$error',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: AppTextStyles.mainTextStyle,
      actions: [
        Center(
          child: TextButton.icon(
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
            icon: const Icon(Icons.refresh),
            label: const Text(
              'Try Again',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

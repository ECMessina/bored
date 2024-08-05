import 'package:bored/loading_spinner.dart';
import 'package:bored/providers/random_activity_provider.dart';
import 'package:bored/to_do_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bored/constants.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomActivity = ref.watch(randomActivityProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: ToDoButton(
            onPressed: () {
              if (randomActivity.isLoading) {
                return;
              }

              ref.invalidate(randomActivityProvider);
            },
          ),
        ),
        Expanded(
          child: Center(
            child: randomActivity.when(
              skipLoadingOnRefresh: false,
              data: (returnedActivity) => Text(returnedActivity.activity),
              error: (err, stack) => AlertDialog(
                backgroundColor: AppColors.backgroundButtonColor,
                title: Text('Error: $err'),
                titleTextStyle: mainTextStyle,
                actions: [
                  Center(
                    child: TextButton.icon(
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
                      onPressed: () {
                        ref.invalidate(randomActivityProvider);
                        // Navigator.of(context).pop();
                      },
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
              ),
              loading: () => const LoadingSpinner(),
            ),
          ),
        ),
      ],
    );
  }
}

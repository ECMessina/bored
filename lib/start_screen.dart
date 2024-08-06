import 'package:bored/loading_spinner.dart';
import 'package:bored/providers/random_activity_provider.dart';
import 'package:bored/to_do_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bored/constants.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  bool userHasTapped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: ToDoButton(
            onPressed: () {
              if (userHasTapped == false) {
                setState(() {
                  userHasTapped = true;
                });
                return;
              }

              final randomActivity = ref.read(randomActivityProvider);

              if (randomActivity.isLoading) {
                return;
              }
              ref.invalidate(randomActivityProvider);
            },
          ),
        ),
        Expanded(
          child: Center(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                if (userHasTapped == false) {
                  return Container();
                } else {
                  final randomActivity = ref.watch(randomActivityProvider);

                  return randomActivity.when(
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
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

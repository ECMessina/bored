// import 'dart:convert';

// import 'package:bored/models/activity_model.dart';
import 'package:bored/providers/random_activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomActivity = ref.watch(randomActivityProvider);

    return Center(
      child: randomActivity.when(
        data: (returnedActivity) => Text(returnedActivity.activity),
        error: (err, stack) => Text('Error: $err'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

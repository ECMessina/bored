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
    // const response = '{"activity":"Do a jigsaw puzzle","availability":1,"type":"recreational","participants":1,"price":0.1,"accessibility":"Few to no challenges","duration":"minutes","kidFriendly":true,"link":"https://en.wikipedia.org/wiki/Jigsaw_puzzle","key":"8550768"}';
    // final returnedActivity = ActivityModel.fromJson(jsonDecode(response) as Map<String, dynamic>);
    // debugPrint(returnedActivity.toString());
    // debugPrint(returnedActivity.type);
    return Center(
      child: randomActivity.when(
        data: (returnedActivity) => Text(returnedActivity),
        error: (err, stack) => Text('Error: $err'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

import 'dart:convert';

import 'package:bored/models/activity_model.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const response = '{"activity":"Do a jigsaw puzzle","availability":1,"type":"recreational","participants":1,"price":0.1,"accessibility":"Few to no challenges","duration":"minutes","kidFriendly":true,"link":"https://en.wikipedia.org/wiki/Jigsaw_puzzle","key":"8550768"}';
    final returnedActivity = ActivityModel.fromJson(jsonDecode(response) as Map<String, dynamic>);
    debugPrint(returnedActivity.toString());
    debugPrint(returnedActivity.type);
    return const Center(
      child: Text('I\'m Bored!'),
    );
  }
}

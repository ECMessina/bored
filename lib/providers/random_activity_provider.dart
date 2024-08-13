import 'dart:convert';

import 'package:bored/models/activity_model.dart';
// import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'random_activity_provider.g.dart';

@riverpod
Future<ActivityModel> randomActivity(RandomActivityRef ref) async {
  // debugPrint('pulling data');
  const activityUrl = 'https://bored-api.appbrewery.com/random';
  final activityResponse = await http.get(Uri.parse(activityUrl));
  // await Future.delayed(const Duration(seconds: 3));

  if (activityResponse.statusCode == 200) {
    // debugPrint(activityResponse.statusCode.toString());
    return ActivityModel.fromJson(jsonDecode(activityResponse.body));
  } else {
    throw Exception('Failed to load random activity');
  }
}

import 'dart:convert';
import 'package:bored/constants.dart';
import 'package:bored/models/activity_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'random_activity_provider.g.dart';

@riverpod
Future<ActivityModel> randomActivity(Ref ref) async {
  try {
    const activityUrl = 'http://bored.api.lewagon.com/api/activity/';
    final activityResponse = await http.get(Uri.parse(activityUrl));
    debugPrint(activityResponse.body);
    if (activityResponse.statusCode == 200) {
      return ActivityModel.fromJson(jsonDecode(activityResponse.body));
    } else {
      throw CustomException('Failed to load random activity');
    }
  } catch (e) {
    throw CustomException('Failed to load random activity');
  }
}

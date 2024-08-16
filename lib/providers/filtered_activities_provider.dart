import 'dart:convert';

import 'package:bored/models/activity_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'filtered_activities_provider.g.dart';

@riverpod
Future<List<ActivityModel>> filteredActivities(FilteredActivitiesRef ref, {String? type, int? participants}) async {
  String filteredActivityUrl = 'https://bored-api.appbrewery.com/filter';

  if (type != null && participants != null) {
    filteredActivityUrl += '?type=$type&participants=$participants';
  } else if (type != null) {
    filteredActivityUrl += '?type=$type';
  } else if (participants != null) {
    filteredActivityUrl += '?participants=$participants';
  }

  final filteredActivityResponse = await http.get(Uri.parse(filteredActivityUrl));

  if (filteredActivityResponse.statusCode == 200) {
    final List<dynamic> activitiesJson = jsonDecode(filteredActivityResponse.body);
    final List<ActivityModel> filteredModels = [];

    for (var activity in activitiesJson) {
      filteredModels.add(ActivityModel.fromJson(activity));
    }

    return filteredModels;
  } else if (filteredActivityResponse.statusCode == 404) {
    throw Exception('No activities documented for your specified search');
  } else {
    throw Exception('Failed to load activities');
  }
}

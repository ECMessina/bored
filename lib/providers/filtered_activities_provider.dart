import 'dart:convert';

import 'package:bored/models/activity_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'filtered_activities_provider.g.dart';

@riverpod
Future<List<ActivityModel>> filteredActivities(
  FilteredActivitiesRef ref, {
  String? type,
  String? participants,
}) async {
  const filteredActivityUrl = 'https://bored-api.appbrewery.com/filter';
  Map<String, String>? userParams = {
    if (type != null) 'type': type,
    if (participants != null) 'participants': participants,
  };

  final filteredActivityResponse = await http.get(
    Uri.parse(filteredActivityUrl).replace(queryParameters: userParams),
  );

  if (filteredActivityResponse.statusCode == 200) {
    final List<dynamic> activitiesJson = jsonDecode(filteredActivityResponse.body);

    final filteredModels = activitiesJson
        .map(
          (activity) => ActivityModel.fromJson(activity),
        )
        .toList();

    return filteredModels;
  } else if (filteredActivityResponse.statusCode == 404) {
    throw Exception('No activities documented for your specified search');
  } else {
    throw Exception('Failed to load activities');
  }
}

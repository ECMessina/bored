import 'package:bored/filtered_activities.dart';
import 'package:bored/models/filtered_activity_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filtered_activities_provider.g.dart';
// import 'dart:convert';
// import 'package:bored/constants.dart';
// import 'package:bored/models/activity_model.dart';
// import 'package:http/http.dart' as http;

@riverpod
Future<List<FilteredActivityModel>> filteredActivities(
  Ref ref, {
  String? type,
  String? participants,
}) async {
  int? participantsInt =
      participants != null ? int.tryParse(participants) : null;

  return FilteredActivities.filteredActivities(
    type: type,
    participants: participantsInt,
  );

// using <List>ActivityModel when the API was under appbrewery:
  // const filteredActivityUrl = 'https://bored-api.appbrewery.com/filter';
  // Map<String, String>? userParams = {
  //   if (type != null) 'type': type,
  //   if (participants != null) 'participants': participants,
  // };

  // try {
  //   final filteredActivityResponse = await http.get(
  //     Uri.parse(filteredActivityUrl).replace(queryParameters: userParams),
  //   );

  //   if (filteredActivityResponse.statusCode == 200) {
  //     final List<dynamic> activitiesJson =
  //         jsonDecode(filteredActivityResponse.body);

  //     final filteredModels = activitiesJson
  //         .map((activity) => ActivityModel.fromJson(activity))
  //         .toList();

  //     return filteredModels;
  //   } else if (filteredActivityResponse.statusCode == 404) {
  //     throw CustomException(
  //         'No activities documented for your specified search');
  //   } else {
  //     throw CustomException('Failed to load activities');
  //   }
  // } catch (e) {
  //   throw CustomException('Failed to load activities');
  // }
}

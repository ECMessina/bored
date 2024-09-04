import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
class ActivityModel with _$ActivityModel {
  const ActivityModel._();
  const factory ActivityModel({
    required String activity,
    required double availability,
    required String type,
    required int participants,
    required double price,
    required String accessibility,
    required String duration,
    required bool kidFriendly,
    required String link,
    required String key,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => _$ActivityModelFromJson(json);

  String getActivityTypeText() {
    switch (activity) {
      case 'education':
        return 'This is educational';
      case 'recreational' || 'social':
        return 'This is a $activity activity';
      case 'charity':
        return 'This is a charitable activity';
      case 'cooking':
        return 'This activity will improve your cooking skills';
      case 'relaxation':
        return 'This will help you relax';
      case 'busywork':
        return 'This activity is for keeping busy';
      case 'diy':
        return 'This is a "Do It Yourself" crafting project';
      case 'music':
        return 'This activity will improve your musicality';
      default:
        return activity;
    }
  }

  String getAvailabilityForActivity() {
    if (availability <= 0.2) {
      return 'Easy to access';
    } else if (availability > 0.2 && availability <= 0.5) {
      return 'Somewhat easy to access';
    } else if (availability > 0.5 && availability <= 0.8) {
      return 'Hard to come by';
    } else if (availability > 0.8 && availability <= 1.0) {
      return 'Very hard to come by';
    }
    return availability.toString();
  }

  String getPriceForActivity() {
    if (price <= 0.2) {
      return 'Cheap!';
    } else if (price > 0.2 && price <= 0.5) {
      return 'Somewhat cheap';
    } else if (price > 0.5 && price <= 0.8) {
      return 'A little pricey';
    } else if (price > 0.8 && price <= 1.0) {
      return 'Expensive';
    }
    return price.toString();
  }
}

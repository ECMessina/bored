// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilteredActivityModelImpl _$$FilteredActivityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FilteredActivityModelImpl(
      activity: json['activity'] as String,
      availability: (json['availability'] as num).toDouble(),
      type: json['type'] as String,
      participants: (json['participants'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      accessibility: json['accessibility'] as String,
      duration: json['duration'] as String,
      kidFriendly: json['kidFriendly'] as bool,
      link: json['link'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$$FilteredActivityModelImplToJson(
        _$FilteredActivityModelImpl instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'availability': instance.availability,
      'type': instance.type,
      'participants': instance.participants,
      'price': instance.price,
      'accessibility': instance.accessibility,
      'duration': instance.duration,
      'kidFriendly': instance.kidFriendly,
      'link': instance.link,
      'key': instance.key,
    };

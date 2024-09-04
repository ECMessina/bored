// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) {
  return _ActivityModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityModel {
  String get activity => throw _privateConstructorUsedError;
  double get availability => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get participants => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get accessibility => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  bool get kidFriendly => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityModelCopyWith<ActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityModelCopyWith<$Res> {
  factory $ActivityModelCopyWith(
          ActivityModel value, $Res Function(ActivityModel) then) =
      _$ActivityModelCopyWithImpl<$Res, ActivityModel>;
  @useResult
  $Res call(
      {String activity,
      double availability,
      String type,
      int participants,
      double price,
      String accessibility,
      String duration,
      bool kidFriendly,
      String link,
      String key});
}

/// @nodoc
class _$ActivityModelCopyWithImpl<$Res, $Val extends ActivityModel>
    implements $ActivityModelCopyWith<$Res> {
  _$ActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? availability = null,
    Object? type = null,
    Object? participants = null,
    Object? price = null,
    Object? accessibility = null,
    Object? duration = null,
    Object? kidFriendly = null,
    Object? link = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      accessibility: null == accessibility
          ? _value.accessibility
          : accessibility // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      kidFriendly: null == kidFriendly
          ? _value.kidFriendly
          : kidFriendly // ignore: cast_nullable_to_non_nullable
              as bool,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityModelImplCopyWith<$Res>
    implements $ActivityModelCopyWith<$Res> {
  factory _$$ActivityModelImplCopyWith(
          _$ActivityModelImpl value, $Res Function(_$ActivityModelImpl) then) =
      __$$ActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activity,
      double availability,
      String type,
      int participants,
      double price,
      String accessibility,
      String duration,
      bool kidFriendly,
      String link,
      String key});
}

/// @nodoc
class __$$ActivityModelImplCopyWithImpl<$Res>
    extends _$ActivityModelCopyWithImpl<$Res, _$ActivityModelImpl>
    implements _$$ActivityModelImplCopyWith<$Res> {
  __$$ActivityModelImplCopyWithImpl(
      _$ActivityModelImpl _value, $Res Function(_$ActivityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? availability = null,
    Object? type = null,
    Object? participants = null,
    Object? price = null,
    Object? accessibility = null,
    Object? duration = null,
    Object? kidFriendly = null,
    Object? link = null,
    Object? key = null,
  }) {
    return _then(_$ActivityModelImpl(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      accessibility: null == accessibility
          ? _value.accessibility
          : accessibility // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      kidFriendly: null == kidFriendly
          ? _value.kidFriendly
          : kidFriendly // ignore: cast_nullable_to_non_nullable
              as bool,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityModelImpl extends _ActivityModel with DiagnosticableTreeMixin {
  const _$ActivityModelImpl(
      {required this.activity,
      required this.availability,
      required this.type,
      required this.participants,
      required this.price,
      required this.accessibility,
      required this.duration,
      required this.kidFriendly,
      required this.link,
      required this.key})
      : super._();

  factory _$ActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityModelImplFromJson(json);

  @override
  final String activity;
  @override
  final double availability;
  @override
  final String type;
  @override
  final int participants;
  @override
  final double price;
  @override
  final String accessibility;
  @override
  final String duration;
  @override
  final bool kidFriendly;
  @override
  final String link;
  @override
  final String key;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ActivityModel(activity: $activity, availability: $availability, type: $type, participants: $participants, price: $price, accessibility: $accessibility, duration: $duration, kidFriendly: $kidFriendly, link: $link, key: $key)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ActivityModel'))
      ..add(DiagnosticsProperty('activity', activity))
      ..add(DiagnosticsProperty('availability', availability))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('participants', participants))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('accessibility', accessibility))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('kidFriendly', kidFriendly))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('key', key));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityModelImpl &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.participants, participants) ||
                other.participants == participants) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.accessibility, accessibility) ||
                other.accessibility == accessibility) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.kidFriendly, kidFriendly) ||
                other.kidFriendly == kidFriendly) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, activity, availability, type,
      participants, price, accessibility, duration, kidFriendly, link, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityModelImplCopyWith<_$ActivityModelImpl> get copyWith =>
      __$$ActivityModelImplCopyWithImpl<_$ActivityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityModelImplToJson(
      this,
    );
  }
}

abstract class _ActivityModel extends ActivityModel {
  const factory _ActivityModel(
      {required final String activity,
      required final double availability,
      required final String type,
      required final int participants,
      required final double price,
      required final String accessibility,
      required final String duration,
      required final bool kidFriendly,
      required final String link,
      required final String key}) = _$ActivityModelImpl;
  const _ActivityModel._() : super._();

  factory _ActivityModel.fromJson(Map<String, dynamic> json) =
      _$ActivityModelImpl.fromJson;

  @override
  String get activity;
  @override
  double get availability;
  @override
  String get type;
  @override
  int get participants;
  @override
  double get price;
  @override
  String get accessibility;
  @override
  String get duration;
  @override
  bool get kidFriendly;
  @override
  String get link;
  @override
  String get key;
  @override
  @JsonKey(ignore: true)
  _$$ActivityModelImplCopyWith<_$ActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

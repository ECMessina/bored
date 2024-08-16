// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_activities_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredActivitiesHash() =>
    r'0c6d3c8859dbcd3446daf281510ed75cf308d855';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [filteredActivities].
@ProviderFor(filteredActivities)
const filteredActivitiesProvider = FilteredActivitiesFamily();

/// See also [filteredActivities].
class FilteredActivitiesFamily extends Family<AsyncValue<List<ActivityModel>>> {
  /// See also [filteredActivities].
  const FilteredActivitiesFamily();

  /// See also [filteredActivities].
  FilteredActivitiesProvider call({
    String? type,
    int? participants,
  }) {
    return FilteredActivitiesProvider(
      type: type,
      participants: participants,
    );
  }

  @override
  FilteredActivitiesProvider getProviderOverride(
    covariant FilteredActivitiesProvider provider,
  ) {
    return call(
      type: provider.type,
      participants: provider.participants,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredActivitiesProvider';
}

/// See also [filteredActivities].
class FilteredActivitiesProvider
    extends AutoDisposeFutureProvider<List<ActivityModel>> {
  /// See also [filteredActivities].
  FilteredActivitiesProvider({
    String? type,
    int? participants,
  }) : this._internal(
          (ref) => filteredActivities(
            ref as FilteredActivitiesRef,
            type: type,
            participants: participants,
          ),
          from: filteredActivitiesProvider,
          name: r'filteredActivitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredActivitiesHash,
          dependencies: FilteredActivitiesFamily._dependencies,
          allTransitiveDependencies:
              FilteredActivitiesFamily._allTransitiveDependencies,
          type: type,
          participants: participants,
        );

  FilteredActivitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.participants,
  }) : super.internal();

  final String? type;
  final int? participants;

  @override
  Override overrideWith(
    FutureOr<List<ActivityModel>> Function(FilteredActivitiesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredActivitiesProvider._internal(
        (ref) => create(ref as FilteredActivitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        participants: participants,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ActivityModel>> createElement() {
    return _FilteredActivitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredActivitiesProvider &&
        other.type == type &&
        other.participants == participants;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, participants.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilteredActivitiesRef
    on AutoDisposeFutureProviderRef<List<ActivityModel>> {
  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `participants` of this provider.
  int? get participants;
}

class _FilteredActivitiesProviderElement
    extends AutoDisposeFutureProviderElement<List<ActivityModel>>
    with FilteredActivitiesRef {
  _FilteredActivitiesProviderElement(super.provider);

  @override
  String? get type => (origin as FilteredActivitiesProvider).type;
  @override
  int? get participants => (origin as FilteredActivitiesProvider).participants;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

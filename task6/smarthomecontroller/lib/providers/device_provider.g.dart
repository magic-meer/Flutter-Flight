// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceNotifier)
final deviceProvider = DeviceNotifierProvider._();

final class DeviceNotifierProvider
    extends $NotifierProvider<DeviceNotifier, List<DeviceModel>> {
  DeviceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceNotifierHash();

  @$internal
  @override
  DeviceNotifier create() => DeviceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DeviceModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DeviceModel>>(value),
    );
  }
}

String _$deviceNotifierHash() => r'5cc863a378e365625b535e0c9139d6857e69c524';

abstract class _$DeviceNotifier extends $Notifier<List<DeviceModel>> {
  List<DeviceModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<DeviceModel>, List<DeviceModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<DeviceModel>, List<DeviceModel>>,
              List<DeviceModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

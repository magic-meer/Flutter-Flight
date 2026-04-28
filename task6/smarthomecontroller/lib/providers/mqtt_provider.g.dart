// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mqttService)
final mqttServiceProvider = MqttServiceProvider._();

final class MqttServiceProvider
    extends $FunctionalProvider<MqttService, MqttService, MqttService>
    with $Provider<MqttService> {
  MqttServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttServiceHash();

  @$internal
  @override
  $ProviderElement<MqttService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MqttService create(Ref ref) {
    return mqttService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MqttService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MqttService>(value),
    );
  }
}

String _$mqttServiceHash() => r'd28e50a871df34bba1de94e6b34be64dc46749a3';

@ProviderFor(mqttConnectionState)
final mqttConnectionStateProvider = MqttConnectionStateProvider._();

final class MqttConnectionStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<MqttConnectionState>,
          MqttConnectionState,
          Stream<MqttConnectionState>
        >
    with
        $FutureModifier<MqttConnectionState>,
        $StreamProvider<MqttConnectionState> {
  MqttConnectionStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttConnectionStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttConnectionStateHash();

  @$internal
  @override
  $StreamProviderElement<MqttConnectionState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<MqttConnectionState> create(Ref ref) {
    return mqttConnectionState(ref);
  }
}

String _$mqttConnectionStateHash() =>
    r'f58a7005e8fa30b9c551412b15d033e9ef150aa9';

@ProviderFor(MqttConfigNotifier)
final mqttConfigProvider = MqttConfigNotifierProvider._();

final class MqttConfigNotifierProvider
    extends $NotifierProvider<MqttConfigNotifier, MqttConfig?> {
  MqttConfigNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mqttConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mqttConfigNotifierHash();

  @$internal
  @override
  MqttConfigNotifier create() => MqttConfigNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MqttConfig? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MqttConfig?>(value),
    );
  }
}

String _$mqttConfigNotifierHash() =>
    r'1d86bf104649b2d97bbc3d515f0bd0320b430567';

abstract class _$MqttConfigNotifier extends $Notifier<MqttConfig?> {
  MqttConfig? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MqttConfig?, MqttConfig?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MqttConfig?, MqttConfig?>,
              MqttConfig?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

import 'package:lucide_icons/lucide_icons.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/device_model.dart';
import '../core/constants/topics.dart';
import 'mqtt_provider.dart';

part 'device_provider.g.dart';

@riverpod
class DeviceNotifier extends _$DeviceNotifier {
  @override
  List<DeviceModel> build() {
    // Initial devices
    final devices = [
      DeviceModel(
        id: '1',
        name: 'Smart Light',
        type: DeviceType.light,
        topic: MqttTopics.light,
        icon: LucideIcons.lightbulb,
      ),
      DeviceModel(
        id: '2',
        name: 'Main Fan',
        type: DeviceType.fan,
        topic: MqttTopics.fan,
        icon: LucideIcons.fan,
      ),
      DeviceModel(
        id: '3',
        name: 'Air Conditioner',
        type: DeviceType.ac,
        topic: MqttTopics.ac,
        icon: LucideIcons.airVent,
      ),
    ];

    // Listen to MQTT messages to sync UI
    ref.listen(mqttServiceProvider, (previous, next) {
      next.messages.listen((message) {
        final topic = message.topic;
        final payload = MqttPublishPayload.bytesToStringAsString(
          (message.payload as MqttPublishMessage).payload.message,
        );
        _updateDeviceState(topic, payload);
      });
    });

    return devices;
  }

  void _updateDeviceState(String topic, String payload) {
    state = [
      for (final device in state)
        if (device.topic == topic)
          device.copyWith(isOn: payload == MqttPayloads.on)
        else
          device
    ];
  }

  void toggleDevice(DeviceModel device) {
    final newState = !device.isOn;
    final payload = newState ? MqttPayloads.on : MqttPayloads.off;
    ref.read(mqttServiceProvider).publish(device.topic, payload);
    
    // Optimistic update
    state = [
      for (final d in state)
        if (d.id == device.id) d.copyWith(isOn: newState) else d
    ];
  }

  void subscribeToAll() {
    final service = ref.read(mqttServiceProvider);
    for (final topic in MqttTopics.all) {
      service.subscribe(topic);
    }
  }
}

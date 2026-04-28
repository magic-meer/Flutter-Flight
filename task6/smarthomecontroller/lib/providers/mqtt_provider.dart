import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/mqtt_service.dart';
import '../models/mqtt_config.dart';

part 'mqtt_provider.g.dart';

@Riverpod(keepAlive: true)
MqttService mqttService(MqttServiceRef ref) {
  final service = MqttService();
  ref.onDispose(() => service.dispose());
  return service;
}

@riverpod
Stream<MqttConnectionState> mqttConnectionState(MqttConnectionStateRef ref) {
  return ref.watch(mqttServiceProvider).connectionState;
}

@riverpod
class MqttConfigNotifier extends _$MqttConfigNotifier {
  @override
  MqttConfig? build() => null;

  void setConfig(MqttConfig config) {
    state = config;
  }
}

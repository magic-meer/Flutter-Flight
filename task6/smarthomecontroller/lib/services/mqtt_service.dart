import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import '../models/mqtt_config.dart';

enum MqttConnectionState { disconnected, connecting, connected, error }

class MqttService {
  MqttServerClient? _client;
  final _connectionStateController =
      StreamController<MqttConnectionState>.broadcast();
  final _messageController = StreamController<MqttReceivedMessage<MqttMessage?>>.broadcast();

  Stream<MqttConnectionState> get connectionState =>
      _connectionStateController.stream;
  Stream<MqttReceivedMessage<MqttMessage?>> get messages => _messageController.stream;

  Future<bool> connect(MqttConfig config) async {
    _connectionStateController.add(MqttConnectionState.connecting);
    _client = MqttServerClient(config.server, config.clientId);
    _client!.port = config.port;
    _client!.keepAlivePeriod = 20;
    _client!.onDisconnected = _onDisconnected;
    _client!.onConnected = _onConnected;
    _client!.onSubscribed = _onSubscribed;
    _client!.logging(on: false);

    final connMessage = MqttConnectMessage()
        .withClientIdentifier(config.clientId)
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    _client!.connectionMessage = connMessage;

    try {
      await _client!.connect(config.username, config.password);
    } catch (e) {
      print('MQTT Exception: $e');
      _disconnect();
      return false;
    }

    if (_client!.connectionStatus!.state == MqttConnectionState.connected) {
      _client!.updates!.listen((List<MqttReceivedMessage<MqttMessage?>> c) {
        final recMess = c[0];
        _messageController.add(recMess);
      });
      return true;
    } else {
      _disconnect();
      return false;
    }
  }

  void _disconnect() {
    _client?.disconnect();
    _connectionStateController.add(MqttConnectionState.disconnected);
  }

  void disconnect() => _disconnect();

  void _onDisconnected() {
    _connectionStateController.add(MqttConnectionState.disconnected);
  }

  void _onConnected() {
    _connectionStateController.add(MqttConnectionState.connected);
  }

  void _onSubscribed(String topic) {
    print('Subscribed to $topic');
  }

  void subscribe(String topic) {
    _client?.subscribe(topic, MqttQos.atLeastOnce);
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client?.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  void dispose() {
    _connectionStateController.close();
    _messageController.close();
    _disconnect();
  }
}

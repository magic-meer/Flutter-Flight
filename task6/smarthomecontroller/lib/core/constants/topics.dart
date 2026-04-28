class MqttTopics {
  static const String light = 'home/light';
  static const String fan = 'home/fan';
  static const String ac = 'home/ac';

  static const List<String> all = [light, fan, ac];
}

class MqttPayloads {
  static const String on = 'ON';
  static const String off = 'OFF';
}

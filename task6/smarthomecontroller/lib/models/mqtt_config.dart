class MqttConfig {
  final String server;
  final int port;
  final String clientId;
  final String? username;
  final String? password;

  MqttConfig({
    required this.server,
    this.port = 1883,
    required this.clientId,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        'server': server,
        'port': port,
        'clientId': clientId,
        'username': username,
        'password': password,
      };

  factory MqttConfig.fromJson(Map<String, dynamic> json) => MqttConfig(
        server: json['server'],
        port: json['port'],
        clientId: json['clientId'],
        username: json['username'],
        password: json['password'],
      );
}

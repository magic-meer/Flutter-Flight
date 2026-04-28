import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/mqtt_config.dart';
import '../providers/mqtt_provider.dart';
import '../services/mqtt_service.dart';
import '../widgets/connection_status_bar.dart';
import 'home_screen.dart';

class ConnectionScreen extends ConsumerStatefulWidget {
  const ConnectionScreen({super.key});

  @override
  ConsumerState<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends ConsumerState<ConnectionScreen> {
  final _serverController = TextEditingController();
  final _portController = TextEditingController();
  final _clientIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  void _loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    _serverController.text =
        prefs.getString('mqtt_server') ?? 'broker.hivemq.com';
    _portController.text = prefs.getString('mqtt_port') ?? '1883';
    _clientIdController.text = prefs.getString('mqtt_client_id') ??
        'flutter_client_${DateTime.now().millisecondsSinceEpoch}';
  }

  void _saveConfig() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mqtt_server', _serverController.text);
    await prefs.setString('mqtt_port', _portController.text);
    await prefs.setString('mqtt_client_id', _clientIdController.text);
  }

  @override
  void dispose() {
    _serverController.dispose();
    _portController.dispose();
    _clientIdController.dispose();
    super.dispose();
  }

  void _connect() async {
    final config = MqttConfig(
      server: _serverController.text,
      port: int.tryParse(_portController.text) ?? 1883,
      clientId: _clientIdController.text,
    );

    ref.read(mqttConfigNotifierProvider.notifier).setConfig(config);
    final success = await ref.read(mqttServiceProvider).connect(config);

    if (success && mounted) {
      _saveConfig();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to connect to MQTT broker')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final status = ref.watch(mqttConnectionStateProvider).value ??
        MqttConnectionState.disconnected;
    final isConnecting = status == MqttConnectionState.connecting;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Icon(
                LucideIcons.home,
                size: 64,
                color: Colors.indigo,
              ),
              const SizedBox(height: 24),
              const Text(
                'Smart Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Connect to your MQTT Broker',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(height: 48),
              TextField(
                controller: _serverController,
                decoration: const InputDecoration(
                  labelText: 'Broker URL',
                  hintText: 'e.g. broker.hivemq.com',
                  prefixIcon: Icon(LucideIcons.globe),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _portController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Port',
                  hintText: 'e.g. 1883',
                  prefixIcon: Icon(LucideIcons.hash),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _clientIdController,
                decoration: const InputDecoration(
                  labelText: 'Client ID',
                  prefixIcon: Icon(LucideIcons.user),
                ),
              ),
              const Spacer(),
              const Center(child: ConnectionStatusBar()),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isConnecting ? null : _connect,
                child: isConnecting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Connect Now'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

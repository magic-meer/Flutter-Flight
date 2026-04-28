import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../providers/mqtt_provider.dart';
import '../services/mqtt_service.dart';
import '../core/theme/app_theme.dart';

class ConnectionStatusBar extends ConsumerWidget {
  const ConnectionStatusBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mqttConnectionStateProvider).value ??
        MqttConnectionState.disconnected;

    Color color;
    String label;
    IconData icon;

    switch (state) {
      case MqttConnectionState.connected:
        color = AppTheme.successColor;
        label = 'Connected';
        icon = LucideIcons.wifi;
        break;
      case MqttConnectionState.connecting:
        color = Colors.orange;
        label = 'Connecting...';
        icon = LucideIcons.refreshCw;
        break;
      case MqttConnectionState.error:
        color = AppTheme.errorColor;
        label = 'Connection Error';
        icon = LucideIcons.wifiOff;
        break;
      case MqttConnectionState.disconnected:
      default:
        color = Colors.white24;
        label = 'Disconnected';
        icon = LucideIcons.wifiOff;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

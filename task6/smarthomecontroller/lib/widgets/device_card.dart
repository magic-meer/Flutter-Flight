import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/device_model.dart';
import '../core/theme/app_theme.dart';

class DeviceCard extends StatelessWidget {
  final DeviceModel device;
  final VoidCallback onToggle;

  const DeviceCard({
    super.key,
    required this.device,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 300.ms,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: device.isOn
            ? AppTheme.primaryColor.withOpacity(0.1)
            : AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: device.isOn
              ? AppTheme.primaryColor
              : Colors.white.withOpacity(0.05),
          width: 2,
        ),
        boxShadow: device.isOn
            ? [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: device.isOn
                      ? AppTheme.primaryColor
                      : Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  device.icon,
                  color: device.isOn ? Colors.white : Colors.white60,
                  size: 24,
                ),
              ).animate(target: device.isOn ? 1 : 0).shimmer(
                    duration: 1.seconds,
                    color: Colors.white.withOpacity(0.2),
                  ),
              Switch.adaptive(
                value: device.isOn,
                onChanged: (_) => onToggle(),
                activeThumbColor: Colors.white,

                activeTrackColor: AppTheme.primaryColor,
              ),

            ],
          ),
          const Spacer(),
          Text(
            device.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            device.isOn ? 'ON' : 'OFF',
            style: TextStyle(
              fontSize: 14,
              color: device.isOn ? AppTheme.accentColor : Colors.white38,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

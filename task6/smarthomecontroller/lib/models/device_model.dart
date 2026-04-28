import 'package:flutter/material.dart';

enum DeviceType { light, fan, ac }

class DeviceModel {
  final String id;
  final String name;
  final DeviceType type;
  final String topic;
  final bool isOn;
  final IconData icon;

  DeviceModel({
    required this.id,
    required this.name,
    required this.type,
    required this.topic,
    this.isOn = false,
    required this.icon,
  });

  DeviceModel copyWith({
    bool? isOn,
  }) {
    return DeviceModel(
      id: id,
      name: name,
      type: type,
      topic: topic,
      isOn: isOn ?? this.isOn,
      icon: icon,
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/register_device_screen.dart';

void main() {
  runApp(const CarTabletApp());
}

class CarTabletApp extends StatelessWidget {
  const CarTabletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Tablet MVP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegisterDeviceScreen(),
    );
  }
}

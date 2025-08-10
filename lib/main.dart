import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const CarTabletAdminApp());
}

class CarTabletAdminApp extends StatelessWidget {
  const CarTabletAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Tablet Admin',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}

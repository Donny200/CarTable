import 'package:flutter/material.dart';
import 'trip_start_screen.dart';

class AdminConfirmationScreen extends StatelessWidget {
  const AdminConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Подтверждение запуска")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.battery_charging_full, size: 40, color: Colors.green),
          const Icon(Icons.wifi, size: 40, color: Colors.green),
          const Icon(Icons.gps_fixed, size: 40, color: Colors.green),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(60),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const TripStartScreen()),
                );
              },
              child: const Text("СТАРТ", style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}

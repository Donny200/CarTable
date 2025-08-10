import 'package:flutter/material.dart';
import 'trip_status_screen.dart';

class TripStartScreen extends StatelessWidget {
  const TripStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/user.png')),
            const SizedBox(height: 20),
            const Text("Поездка начата", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            const Icon(Icons.speed, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const TripStatusScreen()),
                );
              },
              child: const Text("Перейти к статусу поездки"),
            ),
          ],
        ),
      ),
    );
  }
}

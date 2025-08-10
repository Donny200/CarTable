import 'package:flutter/material.dart';
import 'register_device_screen.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Спасибо за поездку!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Icon(Icons.emoji_emotions, color: Colors.orange, size: 100),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const RegisterDeviceScreen()),
                      (route) => false,
                );
              },
              child: const Text("Готово", style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}

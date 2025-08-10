import 'package:flutter/material.dart';
import 'thank_you_screen.dart';

class TripEndScreen extends StatelessWidget {
  final String duration;
  final double distance;
  final double cost;

  const TripEndScreen({
    super.key,
    required this.duration,
    required this.distance,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Поездка завершена")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Итоги поездки", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Время в пути: $duration", style: const TextStyle(fontSize: 18)),
            Text("Пройдено: ${distance.toStringAsFixed(2)} км", style: const TextStyle(fontSize: 18)),
            Text("Стоимость: ${cost.toStringAsFixed(2)} ₽", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ThankYouScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text("Подтвердить", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

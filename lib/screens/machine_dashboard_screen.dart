import 'package:flutter/material.dart';

class MachineDashboardScreen extends StatelessWidget {
  final String carName;
  final String token;
  final int mileage;
  final int fuel;

  const MachineDashboardScreen({
    super.key,
    required this.carName,
    required this.token,
    required this.mileage,
    required this.fuel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Машина: $carName')),
      body: Row(
        children: [
          // Левая половина — данные машины
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Токен: $token', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Text('Пробег: $mileage км', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Text('Топливо: $fuel %', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),

          // Правая половина — круглая кнопка Старт
          Expanded(
            flex: 1,
            child: Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(30),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Машина запущена!')),
                    );
                  },
                  child: const Text(
                    'СТАРТ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

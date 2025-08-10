import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'trip_end_screen.dart';

class TripStatusScreen extends StatefulWidget {
  const TripStatusScreen({super.key});

  @override
  State<TripStatusScreen> createState() => _TripStatusScreenState();
}

class _TripStatusScreenState extends State<TripStatusScreen> {
  late Timer _timer;
  int _secondsElapsed = 0;
  double _mileage = 0.0;
  double _fuelLevel = 80; // %
  double _speed = 0;
  final Random _rand = Random();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _secondsElapsed++;
        _speed = (_rand.nextDouble() * 80).clamp(0, 80); // случайная скорость до 80 км/ч
        _mileage += _speed / 3600; // км за секунду
        _fuelLevel = (_fuelLevel - 0.01).clamp(0, 100); // топливо уменьшается
      });
    });
  }

  String _formatTime(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    final s = seconds % 60;
    return "${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _endTrip() {
    _timer.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => TripEndScreen(
          duration: _formatTime(_secondsElapsed),
          distance: _mileage,
          cost: _mileage * 0.5, // условная цена
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Статус поездки")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Верхняя панель
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  const Icon(Icons.timer, color: Colors.blue),
                  Text(_formatTime(_secondsElapsed), style: const TextStyle(fontSize: 18)),
                ]),
                Column(children: [
                  const Icon(Icons.speed, color: Colors.green),
                  Text("${_speed.toStringAsFixed(1)} км/ч", style: const TextStyle(fontSize: 18)),
                ]),
                Column(children: [
                  const Icon(Icons.local_gas_station, color: Colors.orange),
                  Text("${_fuelLevel.toStringAsFixed(1)}%", style: const TextStyle(fontSize: 18)),
                ]),
              ],
            ),
            const SizedBox(height: 20),
            // Карта (плейсхолдер)
            Expanded(
              child: Container(
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: const Text("Карта с маршрутом (демо)", style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
            // Кнопка завершения поездки
            ElevatedButton(
              onPressed: _endTrip,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text("Завершить поездку", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

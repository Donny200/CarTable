import 'package:flutter/material.dart';
import 'admin_confirmation_screen.dart';

class RegisterDeviceScreen extends StatefulWidget {
  const RegisterDeviceScreen({super.key});

  @override
  State<RegisterDeviceScreen> createState() => _RegisterDeviceScreenState();
}

class _RegisterDeviceScreenState extends State<RegisterDeviceScreen> {
  final TextEditingController _carCodeController = TextEditingController();
  String? errorMessage;

  void _register() {
    if (_carCodeController.text.trim() == "123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AdminConfirmationScreen()),
      );
    } else {
      setState(() {
        errorMessage = "Неверный код автомобиля!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.directions_car, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              TextField(
                controller: _carCodeController,
                decoration: const InputDecoration(
                  labelText: "Код автомобиля",
                  border: OutlineInputBorder(),
                ),
              ),
              if (errorMessage != null) ...[
                const SizedBox(height: 10),
                Text(errorMessage!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: const Text("Зарегистрировать"),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.wifi, color: Colors.green, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}

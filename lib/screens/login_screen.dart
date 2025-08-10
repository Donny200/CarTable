import 'package:flutter/material.dart';
import 'machine_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, Map<String, dynamic>> demoAdmins = {
    'admin123': {
      'carName': 'Tesla Model S',
      'token': 'TOKEN-111',
      'mileage': 15000,
      'fuel': 85
    },
    'superpass': {
      'carName': 'BMW X5',
      'token': 'TOKEN-222',
      'mileage': 73200,
      'fuel': 45
    },
  };

  void _login() {
    String password = _passwordController.text.trim();
    if (demoAdmins.containsKey(password)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => MachineDashboardScreen(
            carName: demoAdmins[password]!['carName'],
            token: demoAdmins[password]!['token'],
            mileage: demoAdmins[password]!['mileage'],
            fuel: demoAdmins[password]!['fuel'],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный пароль!')),
      );
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
              const Text('Введите пароль администратора', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Пароль',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Войти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

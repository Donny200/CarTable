import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> alerts = [
      {
        "text": "Не превышайте 60 км/ч",
        "critical": true,
      },
      {
        "text": "Проверьте уровень топлива",
        "critical": false,
      },
      {
        "text": "Включите фары",
        "critical": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Предупреждения")),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          final alert = alerts[index];
          return Card(
            color: alert["critical"] ? Colors.red.shade100 : Colors.yellow.shade100,
            child: ListTile(
              leading: Icon(
                alert["critical"] ? Icons.warning : Icons.info,
                color: alert["critical"] ? Colors.red : Colors.orange,
              ),
              title: Text(
                alert["text"],
                style: TextStyle(
                  fontWeight: alert["critical"] ? FontWeight.bold : FontWeight.normal,
                  color: alert["critical"] ? Colors.red : Colors.black,
                ),
              ),
              trailing: alert["critical"]
                  ? const Icon(Icons.priority_high, color: Colors.red)
                  : null,
            ),
          );
        },
      ),
    );
  }
}

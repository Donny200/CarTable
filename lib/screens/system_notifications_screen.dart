import 'package:flutter/material.dart';

class SystemNotificationsScreen extends StatelessWidget {
  const SystemNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {"type": "Важное", "text": "Техническое обслуживание через 2 дня"},
      {"type": "Инфо", "text": "Доступно новое обновление ПО"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Системные уведомления")),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: Icon(
              notif["type"] == "Важное" ? Icons.priority_high : Icons.info,
              color: notif["type"] == "Важное" ? Colors.red : Colors.blue,
            ),
            title: Text(notif["text"]),
            subtitle: Text(notif["type"]),
          );
        },
      ),
    );
  }
}

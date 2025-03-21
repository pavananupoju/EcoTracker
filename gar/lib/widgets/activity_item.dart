import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String date;
  final String title;
  final String amount;
  final IconData icon;

  const ActivityItem({
    super.key,
    required this.date,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(icon),
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subject;
  final bool isCompleted;

  const TaskCard({
    super.key,
    required this.title,
    required this.subject,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_circle : Icons.pending_actions,
          color: isCompleted ? Colors.green : Colors.orange,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Mata Pelajaran: $subject'),
        trailing: Checkbox(
          value: isCompleted,
          onChanged: (val) {},
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MeetTheTeamScreen extends StatelessWidget {
  static final List<Map<String, String>> executives = [
    {
      'name': 'Tammy Baloslos',
      'role': 'Co-Founder and CEO – Handles overall operations and customer service.',
    },
    {
      'name': 'Igop Datkilab',
      'role': 'COO - Prepares food, beverages, and oversees café cleanliness.',
    },
    {
      'name': 'Gabrel Galatasaray',
      'role': 'CTO – Maintains PC units, WiFi systems, and assists with technical issues.',
    },
    {
      'name': 'Dugkat Ibalictad',
      'role': 'CFO  – Handles payments and assists with customer concerns.',
    },
    {
      'name': 'Buk Tungsahur',
      'role': 'CCO – Handles payments and assists with customer concerns.',
    },
  ];

  MeetTheTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet the Team'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: executives.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final member = executives[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.person, size: 40, color: Colors.amber),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member['name']!,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          member['role']!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

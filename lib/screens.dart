import 'package:flutter/material.dart';

import 'actual_names.dart';

class MeetTheTeamScreen extends StatelessWidget {
  static final List<Map<String, String>> executives = [
    {
      'name': '${exf[0]} ${exl[0]}',
      'role': 'Co-Founder and CEO – Leads the entire café operation with a focus on strategy, growth, and big-picture direction. Makes key decisions about expansion, partnerships, and brand identity while ensuring the café stays ahead of trends in tech and lifestyle.',
    },
    {
      'name': 'Buk Tungsahur',
      'role': 'Co-Founder and CCO – Shapes the café\'s identity and how it\'s seen by the world. Leads marketing, promotions, design, and communication. From posters and events to social media and ad campaigns, this is the storyteller who brings customers through the door.',
    },
    {
      'name': '${exf[2]} ${exl[2]}',
      'role': 'Co-Founder and COO - Oversees the day-to-day customer experience—everything from the quality of food and beverages to staff service and cleanliness. Ensures operations run smoothly, guests are happy, and service standards are met or exceeded.',
    },
    {
      'name': 'Dugkat Ibalictad',
      'role': 'Co-Founder and CFO  – Handles budgeting, pricing strategy, payroll, and financial planning. Keeps the business profitable while balancing investments in equipment, food supply, and marketing.',
    },
    {
      'name': 'Gabrel Galatasaray',
      'role': 'Co-Founder and CTO – Manages all things tech: high-speed internet, gaming rigs, software, cybersecurity, and digital systems. Ensures the café stays cutting-edge and the tech just works—whether it\'s cloud gaming or coffee-ordering tablets.',
    },
  ];

  const MeetTheTeamScreen({super.key});

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

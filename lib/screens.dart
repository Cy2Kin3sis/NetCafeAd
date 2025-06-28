import 'package:flutter/material.dart';

import 'actual_names.dart';

class MeetTheTeamScreen extends StatelessWidget {
  static final List<Map<String, String>> executives = [
    {
      'name': '${exf[0]} ${exl[0]}',
      'role': 'Co-Founder and CEO: ${exn[0]} leads the entire café operation with a focus on strategy, growth, and big-picture direction. He makes key decisions about expansion, partnerships, and brand identity while ensuring the café stays ahead of trends in tech and lifestyle.',
    },
    {
      'name': '${exf[1]} ${exl[1]}',
      'role': 'Co-Founder and CCO – ${exn[1]} shapes the café\'s identity and how it\'s seen by the world. He leads marketing, promotions, design, and communication. From posters and events to social media and ad campaigns, he is the storyteller who brings customers through the door.',
    },
    {
      'name': '${exf[2]} ${exl[2]}',
      'role': 'Co-Founder and COO - ${exn[2]} oversees the day-to-day customer experience—everything from the quality of food and beverages to staff service and cleanliness. He ensures operations run smoothly, guests are happy, and service standards are met or exceeded.',
    },
    {
      'name': '${exf[3]} ${exl[3]}',
      'role': 'Co-Founder and CFO  – ${exn[3]} handles budgeting, pricing strategy, payroll, and financial planning. He keeps the business profitable while balancing investments in equipment, food supply, and marketing.',
    },
    {
      'name': '${exf[4]} ${exl[4]}',
      'role': 'Co-Founder and CTO – ${exn[4]} manages all things tech: high-speed internet, gaming rigs, software, cybersecurity, and digital systems. He ensures the café stays cutting-edge and the tech just works—whether it\'s cloud gaming or coffee-ordering tablets.',
    },
  ];

  const MeetTheTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meet the Executives')),
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

class BusinessLoreScreen extends StatelessWidget {

  const BusinessLoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
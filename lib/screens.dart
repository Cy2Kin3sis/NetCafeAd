import 'package:flutter/material.dart';

import 'actuals.dart';

class MeetTheTeamScreen extends StatelessWidget {
  static final List<Map<String, String>> executives = [
    {
      'name': '${exf[0]} ${exl[0]}',
      'role': 'CEO: ${exn[0]} leads the entire café operation with a focus on strategy, growth, and big-picture direction. He makes key decisions about expansion, partnerships, and brand identity while ensuring the café stays ahead of trends in tech and lifestyle.',
    },
    {
      'name': '${exf[1]} ${exl[1]}',
      'role': 'CCO – ${exn[1]} shapes the café\'s identity and how it\'s seen by the world. He leads marketing, promotions, design, and communication. From posters and events to social media and ad campaigns, he is the storyteller who brings customers through the door.',
    },
    {
      'name': '${exf[2]} ${exl[2]}',
      'role': 'COO - ${exn[2]} oversees the day-to-day customer experience—everything from the quality of food and beverages to staff service and cleanliness. He ensures operations run smoothly, guests are happy, and service standards are met or exceeded.',
    },
    {
      'name': '${exf[3]} ${exl[3]}',
      'role': 'CFO  – ${exn[3]} handles budgeting, pricing strategy, payroll, and financial planning. He keeps the business profitable while balancing investments in equipment, food supply, and marketing.',
    },
    {
      'name': '${exf[4]} ${exl[4]}',
      'role': 'CTO – ${exn[4]} manages all things tech: high-speed internet, gaming rigs, software, cybersecurity, and digital systems. He ensures the café stays cutting-edge and the tech just works—whether it\'s cloud gaming or coffee-ordering tablets.',
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

  static final List<Map<String, String>> timeline = [
    {
      'year': '1993',
      'event': 'RadoBros Bakery founded in Pittsburgh, PA by ${ff[0]} and ${ff[1]} $fl. Earnings helped support their sick father, Vladimir.'
    },
    {
      'year': '1993 (June)',
      'event': 'Vladimir passed away. ${ff[2]} ${fs[2]}, ${ff[0]}\'s fiancée, helped support the family.'
    },
    {
      'year': '1997',
      'event': '${ff[0]} and ${ff[2]} moved to Biringan, Philippines. D-Net internet café was established.'
    },
    {
      'year': '2017',
      'event': 'Five young entrepreneurs named ${exn[0]} ${exl[0]}, ${exn[1]} ${exl[1]}, ${exn[2]} ${exl[2]}, ${exn[3]} ${exl[3]}, and ${exn[4]} ${exl[4]} joined the business and rebranded it as BDGiT NEaT Cafe Services. The eatery was revived with new snack offerings.'
    },
    {
      'year': '2020–2022',
      'event': 'During the COVID-19 pandemic, BDGiT NEaT adapted with PC rentals, virtual coworking, and online food delivery.'
    },
    {
      'year': '2023-2024',
      'event': 'Launched BDGiT EDU Connect, partnering with schools to provide affordable digital access.'
    },
    {
      'year': '2025',
      'event': '${owf[0]} $fl, ${ff[0]}’s son, steps down as the sole owner to pursue his personal endeavors. He transfers ownership to his cousin, ${owf[1]} \'${own[1]}\' $fl, ${ff[1]}\'s son. BDGiT NEaT is now the undisputed leading internet cafe in Biringan.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Company History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: timeline.length,
          itemBuilder: (context, index) {
            final item = timeline[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Year
                  SizedBox(
                    width: 80,
                    child: Text(
                      item['year']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Event Description
                  Expanded(
                    child: Text(
                      item['event']!,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
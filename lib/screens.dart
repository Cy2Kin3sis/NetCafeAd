import 'package:flutter/material.dart';

import 'actuals.dart';
import 'constants.dart';
import 'contents.dart';
import 'widgets.dart';

class CafeInfoScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final bool isDark;
  final Function(bool) onThemeChanged;

  const CafeInfoScreen({
    super.key,
    required this.themeMode,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToggleBar(
        title: 'BDGiT NE@T Café',
        isDark: isDark,
        themeMode: themeMode,
        onThemeChanged: onThemeChanged,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: [
                Icon(Icons.computer, size: 100, color: Theme.of(context).colorScheme.secondary), sbh12,
                Text('Welcome to BDGiT NE@T Café',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ), sbh8,
                Text(
                  'Beverages, Delicacies, Gaming, Internet, and Tech!',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          sbh32, const Divider(thickness: 1), sbh12,
          Row(
            children: [
              Icon(Icons.breakfast_dining_outlined), sbw8,
              Text('Café Highlights (B.D.)', style: largeTitle(context)),
            ],
          ), sbh12,
          ...[
            'Freshly Brewed Coffee & Teas',
            'Cupcakes, Pandesal, Sandwiches',
            'Cookies, Light Snacks, Pancit Canton',
          ].map((highlight) => ListTile(
            leading: const Icon(Icons.check_circle_outline, color: Colors.amber),
            title: Text(highlight),
          )),
          sbh20,
          Row(
            children: [
              Icon(Icons.computer_outlined),
              sbw8,
              Text('Services Offered (G.I.T.)', style: largeTitle(context)),
            ],
          ), sbh12,
          ...[
            'Piso WiFi, Load Selling',
            'High-end Gaming PC Units',
            'Computer/Laptop Rental (Browsing, Research, Gaming)',
            'Printing, Scanning, Photocopying, & Lamination',
          ].map((service) => ListTile(
            leading: const Icon(Icons.check_circle_outline, color: Colors.amber),
            title: Text(service),
          )), sbh20,
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.location_on, color: Colors.amber, size: 32), sbh8,
                  Text('Visit Us', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  sbh8, Text(
                    '📍 420 Diamond St., Sigbin Avenue, Biringan\n📞 $contactNum',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MeetTheTeamScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final bool isDark;
  final Function(bool) onThemeChanged;
  final List<Map<String, String>> executives;

  const MeetTheTeamScreen({
    super.key,
    required this.themeMode,
    required this.isDark,
    required this.onThemeChanged,
    required this.executives,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToggleBar(title: 'Meet the Team', isDark: isDark, themeMode: themeMode, onThemeChanged: onThemeChanged),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: executives.length,
        separatorBuilder: (context, index) => sbh12,
        itemBuilder: (context, index) {
          final member = executives[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.amber.withAlpha(50),
                    child: const Icon(Icons.person, size: 30, color: Colors.amber),
                  ), sbw16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(member['name']!, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)), sbh4,
                        Text(member['role']!, style: Theme.of(context).textTheme.bodyMedium),
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
  final ThemeMode themeMode;
  final bool isDark;
  final Function(bool) onThemeChanged;
  final List<Map<String, String>> timeline;

  const BusinessLoreScreen({
    super.key,
    required this.themeMode,
    required this.isDark,
    required this.onThemeChanged,
    required this.timeline,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToggleBar(title: 'Company History', isDark: isDark, themeMode: themeMode, onThemeChanged: onThemeChanged),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: timeline.length,
          itemBuilder: (context, index) {
            final item = timeline[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(item['year']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Theme.of(context).colorScheme.primary)),
                  ), sbw12,
                  Expanded(child: Text(item['event']!, style: b2)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CompanyBlogScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final bool isDark;
  final Function(bool) onThemeChanged;

  const CompanyBlogScreen({
    super.key,
    required this.themeMode,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToggleBar(title: 'Company Blog', isDark: isDark, themeMode: themeMode, onThemeChanged: onThemeChanged),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlogPost(title: 'New business arising in the international market this year', date: '11 March 2019', content: march1119, isDark: isDark, themeMode: themeMode, onThemeChanged: onThemeChanged), sbh8,
              BlogPost(title: 'New building to rise in 2023', date: '16 May 2021', content: may1621,isDark: isDark, themeMode: themeMode, onThemeChanged: onThemeChanged)
            ]
          ),
        ),
      ),
    );
  }
}
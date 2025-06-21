import 'package:flutter/material.dart';

class BDGiT extends StatelessWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode themeMode;

  const BDGiT({
    super.key,
    required this.onThemeChanged,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BDGiT NE@T Café'),
        actions: [
          Row(
            children: [
              Icon(isDark ? Icons.dark_mode : Icons.light_mode),
              Switch(
                value: isDark,
                onChanged: onThemeChanged,
                activeColor: Colors.amber,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: [
                Icon(Icons.computer, size: 100, color: Theme.of(context).colorScheme.secondary),
                const SizedBox(height: 10),
                Text(
                  'Welcome to BDGiT NE@T Café',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  'Beverages, Delicacies, Gaming, Internet, and Tech!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          Text('🥐 Café Highlights (BD)', style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 10),
          ...[
            'Freshly Brewed Coffee & Teas',
            'Cupcakes, Pandesal',
            'Sandwiches, Cookies',
            'Light Snacks, Pancit Canton',
            'Iced Tea, Soft Drinks',
          ].map((highlight) => ListTile(
            leading: const Icon(Icons.check_circle_outline, color: Colors.amber),
            title: Text(highlight)
          )),
          Text('💻 Services Offered (GiT)', style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 10),
          ...[
            'Piso WiFi',
            'High-end Gaming PC Units',
            'Computer/Laptop Rental (Browsing, Research, Gaming)',
            'Printing & Scanning',
            'Photocopying & Lamination',
            'Load Selling',
          ].map((service) => ListTile(
            leading: const Icon(Icons.check_circle_outline, color: Colors.amber),
            title: Text(service),
          )),

          const SizedBox(height: 20),
          Center(
            child: Text(
              '📍 Located at: 420 Diamond St., Sigbin Avenue, Biringan\n📞 Call us: 0900 012 3456',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

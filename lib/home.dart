import 'package:flutter/material.dart';
import 'screens.dart';
import 'widgets.dart';

class BDGiT extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode themeMode;

  const BDGiT({super.key, required this.onThemeChanged, required this.themeMode});

  @override
  BDGiTState createState() => BDGiTState();
}
class BDGiTState extends State<BDGiT> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Get the list of pages
  List<Widget> get _pages => [_buildCafeInfoPage(), _buildMeetTheTeamPage(), _buildBusinessLorePage()];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildCafeInfoPage() {
    final isDark = widget.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: ToggleBar(title: 'BDGiT NE@T Café', isDark: isDark, themeMode: widget.themeMode, onThemeChanged: widget.onThemeChanged),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.computer,
                  size: 100,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome to BDGiT NE@T Café',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  'Beverages, Delicacies, Gaming, Internet, and Tech!',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.breakfast_dining_outlined),
              const SizedBox(width: 8),
              Text(
                'Café Highlights (BD)',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ]
          ),
          const SizedBox(height: 10),
          ...[
            'Freshly Brewed Coffee & Teas',
            'Cupcakes, Pandesal',
            'Sandwiches, Cookies',
            'Light Snacks, Pancit Canton',
            'Iced Tea, Soft Drinks',
          ].map((highlight) => ListTile(
            leading: const Icon(Icons.check_circle_outline, color: Colors.amber),
            title: Text(highlight),
          )),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.computer_outlined),
              const SizedBox(width: 8),
              Text(
                'Services Offered (GiT)',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
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
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.amber,
                    size: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Visit Us',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '📍 420 Diamond St., Sigbin Avenue, Biringan\n📞 0900 012 3456',
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

  Widget _buildMeetTheTeamPage() {
    final isDark = widget.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: ToggleBar(title: 'Meet the Team', isDark: isDark, themeMode: widget.themeMode, onThemeChanged: widget.onThemeChanged),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: MeetTheTeamScreen.executives.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final member = MeetTheTeamScreen.executives[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.amber.withValues(alpha: 0.2),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member['name']!,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
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

  Widget _buildBusinessLorePage() {
    final isDark = widget.themeMode == ThemeMode.dark;
    final history = BusinessLoreScreen.timeline;

    return Scaffold(
      appBar: ToggleBar(title: 'Company History', isDark: isDark, themeMode: widget.themeMode, onThemeChanged: widget.onThemeChanged),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            final item = history[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      item['year']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => _pages[index],
          ),
          // Navigation indicators
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.amber
                        : Colors.amber.withAlpha(77),
                  ),
                ),
              ),
            ),
          ),
          // Navigation arrows
          if (_currentPage > 0)
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.amber),
                  onPressed: _previousPage,
                ),
              ),
            ),
          if (_currentPage < _pages.length - 1)
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.amber),
                  onPressed: _nextPage,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
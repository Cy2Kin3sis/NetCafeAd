import 'package:flutter/material.dart';
import 'constants.dart';
import 'contents.dart';
import 'screens.dart';

class BDGiT extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final ThemeMode themeMode;

  const BDGiT({super.key, required this.onThemeChanged, required this.themeMode});

  @override
  BDGiTState createState() => BDGiTState();
}
class BDGiTState extends State<BDGiT> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  // Get the list of pages
  List<Widget> get _pages => [
    CafeInfoScreen(themeMode: widget.themeMode, isDark: widget.themeMode == ThemeMode.dark, onThemeChanged: widget.onThemeChanged),
    MeetTheTeamScreen(themeMode: widget.themeMode, isDark: widget.themeMode == ThemeMode.dark, onThemeChanged: widget.onThemeChanged, executives: executives),
    BusinessLoreScreen(themeMode: widget.themeMode, isDark: widget.themeMode == ThemeMode.dark, onThemeChanged: widget.onThemeChanged, timeline: timeline),
    CompanyBlogScreen(themeMode: widget.themeMode, isDark: widget.themeMode == ThemeMode.dark, onThemeChanged: widget.onThemeChanged),
  ];

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: PageView(controller: _pageController, onPageChanged: (index) => setState(() => _currentIndex = index), children: _pages),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      selectedItemColor: themeColor,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Team'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Blog'),
      ],
    ),
  );
}

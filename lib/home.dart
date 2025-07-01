import 'package:flutter/material.dart';
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
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isHovering = false;

  // Get the list of pages
  List<Widget> get _pages => [
    CafeInfoScreen(themeMode: widget.themeMode, isDark: widget.themeMode == ThemeMode.dark, onThemeChanged: widget.onThemeChanged),
    MeetTheTeamScreen(themeMode: widget.themeMode, isDark: widget.themeMode == ThemeMode.dark, onThemeChanged: widget.onThemeChanged, executives: executives),
    BusinessLoreScreen(themeMode: widget.themeMode, isDark: widget.themeMode == ThemeMode.dark, onThemeChanged: widget.onThemeChanged, timeline: timeline),
    CompanyBlogScreen(themeMode: widget.themeMode, isDark: widget.themeMode == ThemeMode.dark, onThemeChanged: widget.onThemeChanged),
  ];


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

  @override
  Widget build(BuildContext context) => Scaffold(
      body: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: Stack(
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

            // Left arrow (previous)
            if (_currentPage > 0)
              Positioned(
                left: 10,
                top: MediaQuery.of(context).size.height / 2 - 30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isHovering ? 1.0 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(75),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.amber),
                      onPressed: _previousPage,
                    ),
                  ),
                ),
              ),

            // Right arrow (next)
            if (_currentPage < _pages.length - 1)
              Positioned(
                right: 10,
                top: MediaQuery.of(context).size.height / 2 - 30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isHovering ? 1.0 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(75),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.amber),
                      onPressed: _nextPage,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
}
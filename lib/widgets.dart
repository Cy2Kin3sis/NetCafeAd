import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'constants.dart';


/// Reusable app bar that toggles between light and dark mode.
class ToggleBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDark;
  final ThemeMode themeMode;
  final Function(bool) onThemeChanged;
  const ToggleBar({super.key, required this.title, required this.isDark, required this.themeMode, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) => AppBar(
    title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          Switch(value: isDark, onChanged: onThemeChanged, activeColor: Colors.amber),
        ]),
      )
    ],
  );
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Reusable widget for blog posts on the blog screen.
class BlogPost extends StatelessWidget {
  final String title;
  final String date;
  final List<Widget> content;
  final bool isDark;
  final ThemeMode themeMode;
  final Function(bool) onThemeChanged;

  const BlogPost({
    super.key,
    required this.title,
    required this.date,
    required this.content,
    required this.isDark,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ExpansionTile(
      title: AutoSizeText(title, maxLines: 1, minFontSize: 8, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
      backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade400,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Published on $date', style: b3.copyWith(fontStyle: FontStyle.italic, color: isDark ? Colors.grey[300] : Colors.blueGrey)),
              const SizedBox(height: 12),
              Column(children: content),
            ],
          ),
        ),
      ],
    );
  }
}


/// Reusable slideshow.
class SlideshowWidget extends StatefulWidget {
  final List<String> images;
  final bool autoPlay;
  final Duration interval;

  const SlideshowWidget({
    super.key,
    required this.images,
    this.autoPlay = true,
    this.interval = const Duration(seconds: 3),
  });

  @override
  State<SlideshowWidget> createState() => _SlideshowWidgetState();
}

class _SlideshowWidgetState extends State<SlideshowWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late final List<String> _images;
  late final Duration _interval;

  @override
  void initState() {
    super.initState();
    _images = widget.images;
    _interval = widget.interval;

    if (widget.autoPlay) {
      Future.delayed(_interval, _nextSlide);
    }
  }

  void _nextSlide() {
    if (!mounted) return;
    if (_images.length <= 1) return;

    _currentPage = (_currentPage + 1) % _images.length;
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    Future.delayed(_interval, _nextSlide);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.bottomCenter,
    children: [
      AspectRatio(
        aspectRatio: 16 / 9,
        child: PageView.builder(
          controller: _pageController,
          itemCount: _images.length,
          itemBuilder: (context, index) => Image.network(
            _images[index],
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) =>
            progress == null ? child : const Center(child: CircularProgressIndicator()),
          ),
          onPageChanged: (index) => setState(() => _currentPage = index),
        ),
      ),
      // Dots indicator
      Positioned(
        bottom: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_images.length, (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 8,
            height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: _currentPage == index ? Colors.amber : Colors.white.withAlpha(102)),
          )),
        ),
      ),
    ],
  );
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'constants.dart';

class ToggleBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDark;
  final ThemeMode themeMode;
  final Function(bool) onThemeChanged;
  const ToggleBar({super.key, required this.title, required this.isDark, required this.themeMode, required this.onThemeChanged});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(isDark ? Icons.dark_mode : Icons.light_mode),
              Switch(value: isDark, onChanged: onThemeChanged, activeColor: Colors.amber),
            ],
          ),
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

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
    //final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black87;

    return ExpansionTile(
      title: AutoSizeText(
        title,
        maxLines: 1,
        minFontSize: 8,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: isDark
          ? Colors.grey.shade800
          : Colors.grey.shade400,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Published on $date',
                style: b3.copyWith(
                  fontStyle: FontStyle.italic,
                  color: isDark ? Colors.grey[300] : Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 12),
              Column(children: content),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageSlideshow extends StatefulWidget {
  final List<String> images;
  final double height;
  final Duration autoPlayDuration;
  final bool autoPlay;
  final bool showDots;
  final bool showArrows;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const ImageSlideshow({
    super.key,
    required this.images,
    this.height = 300,
    this.autoPlayDuration = const Duration(seconds: 3),
    this.autoPlay = true,
    this.showDots = true,
    this.showArrows = true,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  State<ImageSlideshow> createState() => _ImageSlideshowState();
}

class _ImageSlideshowState extends State<ImageSlideshow> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(widget.autoPlayDuration, (timer) {
      if (_currentIndex < widget.images.length - 1) {
        _nextImage();
      } else {
        _goToImage(0);
      }
    });
  }

  void _stopAutoPlay() {
    _timer?.cancel();
  }

  void _nextImage() {
    if (_currentIndex < widget.images.length - 1) {
      _goToImage(_currentIndex + 1);
    }
  }

  void _previousImage() {
    if (_currentIndex > 0) {
      _goToImage(_currentIndex - 1);
    }
  }

  void _goToImage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: widget.borderRadius,
        ),
        child: const Center(
          child: Icon(
            Icons.image_not_supported,
            size: 50,
            color: Colors.grey,
          ),
        ),
      );
    }

    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          // Image PageView
          ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (widget.autoPlay) {
                      _stopAutoPlay();
                      Future.delayed(const Duration(seconds: 5), () {
                        _startAutoPlay();
                      });
                    }
                  },
                  child: Image.network(
                    widget.images[index],
                    fit: widget.fit,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // Navigation Arrows
          if (widget.showArrows && widget.images.length > 1) ...[
            // Left Arrow
            Positioned(
              left: 10,
              top: 0,
              bottom: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _previousImage,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(128),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            // Right Arrow
            Positioned(
              right: 10,
              top: 0,
              bottom: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _nextImage,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(128),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],

          // Dots Indicator
          if (widget.showDots && widget.images.length > 1)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                      (index) => GestureDetector(
                    onTap: () => _goToImage(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.white
                            : Colors.white.withAlpha(128),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

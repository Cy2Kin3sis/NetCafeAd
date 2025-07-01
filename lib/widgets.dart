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
  final String content;
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
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black87;

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
              Text(
                content,
                style: b2.copyWith(
                  height: 1.5,
                  color: textColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

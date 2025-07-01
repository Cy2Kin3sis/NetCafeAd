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

  const BlogPost({super.key, required this.title, required this.date, required this.content});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: AutoSizeText(title, maxLines: 1, minFontSize: 8),
      backgroundColor: Colors.grey,
      children: [
        Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Published on $date', style: b3.copyWith(fontStyle: FontStyle.italic, color: Colors.blueGrey)), sbh12,
              Text(content, style: b2.copyWith(height: 1.5), textAlign: TextAlign.justify),
            ],
          ),
        ),
      ]
    );
  }
}
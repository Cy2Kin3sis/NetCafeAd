import 'package:flutter/material.dart';

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

/*
class Scrollable extends StatelessWidget {
  final List<Widget> children;

}
*/

class BlogPost extends StatelessWidget {
  final String title;
  final DateTime date;
  final String content;

  const BlogPost({super.key, required this.title, required this.date, required this.content});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text()
            ],
          ),
        ),
      ]
    );
  }
}
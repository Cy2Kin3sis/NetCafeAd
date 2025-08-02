import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

/// Main method
void main() => runApp(const NetCafeAd());

/// Main app class
class NetCafeAd extends StatefulWidget {
  const NetCafeAd({super.key});
  @override
  State<NetCafeAd> createState() => _NetCafeAdState();
}
class _NetCafeAdState extends State<NetCafeAd> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  /// Loads the app's theme.
  ///
  /// Has both dark or light mode.
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    setState(() => _themeMode = isDark ? ThemeMode.dark : ThemeMode.light);
  }

  /// Toggles between light and dark mode.
  Future<void> _toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
    setState(() => _themeMode = isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'BDGiT NE@T Cafe',
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.amber, foregroundColor: Colors.black87),
      textTheme: TextTheme(bodyMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[900],
      primaryColor: Colors.amber,
      appBarTheme: AppBarTheme(backgroundColor: Colors.black87, foregroundColor: Colors.amber),
      textTheme: TextTheme(bodyMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
    ),
    themeMode: _themeMode,
    home: BDGiT(onThemeChanged: _toggleTheme, themeMode: _themeMode),
    debugShowCheckedModeBanner: false,
  );
}
import 'package:flutter/material.dart';
import 'package:glass_bottom_navigation/glass_bottom_navigation.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glass Bottom Navigation Example',
      theme: ThemeData(useMaterial3: true),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  static const _items = [
    GlassBarItem(icon: Icons.home_rounded, label: 'Home'),
    GlassBarItem(icon: Icons.chat_rounded, label: 'Chat'),
    GlassBarItem(icon: Icons.settings_rounded, label: 'Settings'),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final activeItem = _items[_currentIndex];

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: Text(
              activeItem.label,
              key: ValueKey(activeItem.label),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.only(bottom: 12),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GlassBottomBar(
            items: _items,
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            style: const GlassBottomNavStyle(showSpecularDot: false),
            onSearchTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Search tapped')));
            },
          ),
        ),
      ),
    );
  }
}

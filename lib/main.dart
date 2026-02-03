import 'package:flutter/material.dart';
import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sikh Wisdom',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: const Color(0xFF2E7D32), // calm spiritual green
        scaffoldBackgroundColor: const Color(0xFFF8F5F0), // soft religious tone
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

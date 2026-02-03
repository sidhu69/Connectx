import 'package:flutter/material.dart';

class GurbaniReaderScreen extends StatelessWidget {
  final String title;
  final String text;

  const GurbaniReaderScreen({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F0), // Page background
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white, // <-- Top Gurbani text is now white
          ),
        ),
        backgroundColor: const Color(0xFF1C2A4A), // Deep blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              height: 1.8,
              color: Colors.black87, // Text inside page remains dark
            ),
          ),
        ),
      ),
    );
  }
}

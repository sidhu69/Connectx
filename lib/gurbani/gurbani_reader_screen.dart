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
      backgroundColor: const Color(0xFFF8F5F0),
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1C2A4A),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 18,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

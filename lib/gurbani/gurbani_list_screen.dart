import 'package:flutter/material.dart';
import 'gurbani_reader_screen.dart';
import 'gurbani_data.dart';

class GurbaniListScreen extends StatelessWidget {
  const GurbaniListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gurbani"),
        backgroundColor: const Color(0xFF1C2A4A),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: gurbaniText.keys.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final title = gurbaniText.keys.elementAt(index);
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GurbaniReaderScreen(
                    title: title,
                    text: gurbaniText[title]!,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFF9933),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

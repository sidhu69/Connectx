import 'package:flutter/material.dart';
import 'gurbani_data.dart';
import 'gurbani_reader_screen.dart';

class GurbaniListScreen extends StatelessWidget {
  const GurbaniListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = gurbaniText.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nitnem Banis',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1C2A4A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: titles.isEmpty
          ? const Center(
              child: Text('No banis available'),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: titles.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final title = titles[index];

                return Card(
                  color: const Color(0xFFF8F5F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => GurbaniReaderScreen(
                            title: title,
                            text: gurbaniText[title]!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

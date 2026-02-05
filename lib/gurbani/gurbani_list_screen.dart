import 'package:flutter/material.dart';
import 'bani_model.dart';
import 'gurbani_data.dart';
import 'gurbani_reader_screen.dart';

class GurbaniListScreen extends StatelessWidget {
  const GurbaniListScreen({super.key});

  Future<List<Bani>> _loadBanis() async {
    // Simulate async load (e.g. from assets later)
    await Future.delayed(const Duration(milliseconds: 300));
    return kBanis;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nitnem Banis'),
        backgroundColor: const Color(0xFF1C2A4A),
      ),
      body: FutureBuilder<List<Bani>>(
        future: _loadBanis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Failed to load banis',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          final banis = snapshot.data ?? [];

          if (banis.isEmpty) {
            return const Center(
              child: Text('No banis available'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: banis.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final bani = banis[index];
              return Card(
                color: const Color(0xFFF8F5F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(
                    bani.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => GurbaniReaderScreen(
                          title: bani.title,
                          text: bani.text,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

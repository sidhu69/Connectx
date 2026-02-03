import 'package:flutter/material.dart';
import '../gurbani/gurbani_list_screen.dart'; // Added import

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F0), // soft parchment
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Title
              const Text(
                'ੴ',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1C2A4A), // deep blue
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sikh Wisdom',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1C2A4A),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Gurbani • Jeevan • Gyaan',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 48),

              // Buttons
              _HomeButton(
                title: 'Gurbani',
                icon: Icons.menu_book_rounded,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GurbaniListScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              _HomeButton(
                title: 'Jeevan Katha',
                icon: Icons.auto_stories_rounded,
                onTap: () {
                  // TODO: Navigate to Jeevan Katha screen
                },
              ),
              const SizedBox(height: 20),

              _HomeButton(
                title: 'Sawal / Jawab',
                icon: Icons.question_answer_rounded,
                onTap: () {
                  // TODO: Navigate to Q&A screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _HomeButton({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFFFF9933), // kesari
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

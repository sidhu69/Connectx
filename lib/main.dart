import 'package:flutter/material.dart';

void main() {
  runApp(const ConnectXApp());
}

class ConnectXApp extends StatelessWidget {
  const ConnectXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ConnectX',
      home: Scaffold(
        appBar: AppBar(title: const Text('ConnectX')),
        body: const Center(
          child: Text(
            'ConnectX is Live 🚀',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}

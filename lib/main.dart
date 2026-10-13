import 'package0:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habesha Marte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Habesha Marte'),
        ),
        body: const Center(
          child: Text('Welcome to Habesha Marte!'),
        ),
      ),
    );
  }
}

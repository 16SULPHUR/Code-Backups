import 'package:flutter/material.dart';
import 'package:reactapp/tic_tac_toe_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    const  title: 'Tic Tac Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TicTacToeScreen(title: 'Ti'),
    );
  }
}

// 017
// 345
// 648
// 036
// 147
// 158
// 048
// 246
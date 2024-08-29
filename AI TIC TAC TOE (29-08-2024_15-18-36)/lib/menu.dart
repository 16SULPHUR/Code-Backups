import 'package:flutter/material.dart';
import 'package:loginpage/GameHistoryScreen.dart';
import 'package:loginpage/tic_tac_toe_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Tic Tac Toe", style: const TextStyle(color: Colors.tealAccent)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicTacToeScreen(
                      title: "Single Player",
                      isSinglePlayer: true,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Single Player",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicTacToeScreen(
                      title: "Two Player",
                      isSinglePlayer: false,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Two Player",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameHistoryScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purpleAccent,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  child: const Text(
    "View History",
    style: TextStyle(fontSize: 18, color: Colors.white),
  ),
),

          ],
        ),
      ),
    );
  }
}

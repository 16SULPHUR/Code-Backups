import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameHistoryScreen extends StatefulWidget {
  @override
  _GameHistoryScreenState createState() => _GameHistoryScreenState();
}

class _GameHistoryScreenState extends State<GameHistoryScreen> {
  List<String> gameHistory = [];

  @override
  void initState() {
    super.initState();
    loadGameHistory();
  }

  void loadGameHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      gameHistory = prefs.getStringList('gameHistory') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game History"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: gameHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              gameHistory[index],
              style: TextStyle(color: Colors.tealAccent),
            ),
          );
        },
      ),
    );
  }
}

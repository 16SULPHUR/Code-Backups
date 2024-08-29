import 'dart:math';
import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  final String title;

  const TicTacToeScreen({super.key, required this.title});

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> values = List.filled(9, '');
  bool player1 = true;
  bool gameOverOrNot = false;
  bool playWithComputer =
      false; // Added to toggle between player and computer mode
  String msg = "";
  int player1count = 0;
  int player2count = 0;
  String playerA = "Player A";
  String playerB = "Player B";

  TextEditingController playerAController = TextEditingController();
  TextEditingController playerBController = TextEditingController();

  void changePlayer() {
    setState(() {
      player1 = !player1;
    });
  }

  void playAgain() {
    setState(() {
      values = List.filled(9, '');
      player1 = true;
      gameOverOrNot = false;
      msg = "";
    });
  }

  bool checkWin(List<String> values) {
    bool condition1 =
        values[0] == values[1] && values[1] == values[2] && values[2] == 'X';
    bool condition2 =
        values[3] == values[4] && values[4] == values[5] && values[5] == 'X';
    bool condition3 =
        values[6] == values[7] && values[7] == values[8] && values[8] == 'X';
    bool condition4 =
        values[0] == values[3] && values[3] == values[6] && values[6] == 'X';
    bool condition5 =
        values[1] == values[4] && values[4] == values[7] && values[7] == 'X';
    bool condition6 =
        values[2] == values[5] && values[5] == values[8] && values[8] == 'X';
    bool condition7 =
        values[0] == values[4] && values[4] == values[8] && values[8] == 'X';
    bool condition8 =
        values[2] == values[4] && values[4] == values[6] && values[6] == 'X';
    bool condition9 =
        values[0] == values[1] && values[1] == values[2] && values[2] == 'O';
    bool condition10 =
        values[3] == values[4] && values[4] == values[5] && values[5] == 'O';
    bool condition11 =
        values[6] == values[7] && values[7] == values[8] && values[8] == 'O';
    bool condition12 =
        values[0] == values[3] && values[3] == values[6] && values[6] == 'O';
    bool condition13 =
        values[1] == values[4] && values[4] == values[7] && values[7] == 'O';
    bool condition14 =
        values[2] == values[5] && values[5] == values[8] && values[8] == 'O';
    bool condition15 =
        values[0] == values[4] && values[4] == values[8] && values[8] == 'O';
    bool condition16 =
        values[2] == values[4] && values[4] == values[6] && values[6] == 'O';

    return condition1 ||
        condition2 ||
        condition3 ||
        condition4 ||
        condition5 ||
        condition6 ||
        condition7 ||
        condition8 ||
        condition9 ||
        condition10 ||
        condition11 ||
        condition12 ||
        condition13 ||
        condition14 ||
        condition15 ||
        condition16;
  }

  void computerMove() {
    List<int> availableMoves = [];
    for (int i = 0; i < values.length; i++) {
      if (values[i] == '') {
        availableMoves.add(i);
      }
    }

    if (availableMoves.isNotEmpty) {
      final random = Random();
      int move = availableMoves[random.nextInt(availableMoves.length)];
      setState(() {
        values[move] = 'O';
        if (checkWin(values)) {
          gameOverOrNot = true;
          msg = "Computer Won";
          player2count++;
        } else if (emptyValues(values)) {
          gameOverOrNot = true;
          msg = "It's a Draw";
        } else {
          changePlayer();
        }
      });
    }
  }

  bool emptyValues(List<String> values) {
    for (String value in values) {
      if (value == '') return false;
    }
    return true;
  }

  Widget button() {
    if (!gameOverOrNot) {
      return const SizedBox.shrink();
    }
    return ElevatedButton(
      onPressed: () {
        playAgain();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "Play Again",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget getText() {
    return Text(
      gameOverOrNot
          ? msg
          : player1
              ? "$playerA's Turn"
              : (playWithComputer ? "Computer's Turn" : "$playerB's Turn"),
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.title),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                playWithComputer = false;
                playAgain();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Play with Player",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                playWithComputer = true;
                playAgain();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Play with Computer",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                playAgain();
                player1count = 0;
                player2count = 0;
              });
            },
            child: const Text("Restart"),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "$playerA : $player1count",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            // const SizedBox(height: 10),
            Text(
              "$playerB: $player2count",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 10),
            getText(),

            SizedBox(
              height: 400,
              width: 400,
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: List.generate(
                  9,
                  (index) => Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (values[index] == '' && !gameOverOrNot) {
                            values[index] = player1 ? 'X' : 'O';
                            if (checkWin(values)) {
                              gameOverOrNot = true;
                              msg = player1 ? "$playerA Won" : "$playerB Won";
                              if (player1) {
                                player1count++;
                              } else {
                                player2count++;
                              }
                            } else if (emptyValues(values)) {
                              gameOverOrNot = true;
                              msg = "It's a Draw";
                            } else {
                              changePlayer();
                              if (playWithComputer &&
                                  !gameOverOrNot &&
                                  !player1) {
                                // Computer's move
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  computerMove();
                                });
                              }
                            }
                          }
                        });
                      },
                      child: Center(
                        child: Text(
                          values[index],
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color:
                                values[index] == 'X' ? Colors.blue : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            button(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Enter Player Names'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: playerAController,
                      decoration: const InputDecoration(
                        labelText: 'Player A',
                      ),
                    ),
                    TextField(
                      controller: playerBController,
                      decoration: const InputDecoration(
                        labelText: 'Player B',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cancel button
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        playerA = playerAController.text;
                        playerB = playerBController.text;
                        player1count = 0;
                        player2count = 0;
                        playAgain();
                      });
                      Navigator.of(context).pop(); // Submit button
                    },
                    child: const Text('Submit'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

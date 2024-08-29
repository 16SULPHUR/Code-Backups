import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loginpage/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicTacToeScreen extends StatefulWidget {
  final String title;
  final bool isSinglePlayer;

  const TicTacToeScreen({
    super.key,
    required this.title,
    required this.isSinglePlayer,
  });

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> values = List.filled(9, '');
  bool player1 = true;
  bool gameOverOrNot = false;
  String msg = "";
  int player1count = 0;
  int player2count = 0;
  Timer? countdownTimer;
  int remainingTime = 10;

  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();

  void saveGameResult(String result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> gameHistory = prefs.getStringList('gameHistory') ?? [];

    String player1Name =
        player1Controller.text.isEmpty ? "Player 1" : player1Controller.text;
    String player2Name =
        player2Controller.text.isEmpty ? "Player 2" : player2Controller.text;

    gameHistory.add("$player1Name vs $player2Name: $result");
    await prefs.setStringList('gameHistory', gameHistory);
  }

  void changePlayer() {
    setState(() {
      player1 = !player1;
      resetTimer();
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

    if (condition1 ||
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
        condition16) {
      return true;
    }
    return false;
  }

  void resetTimer() {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
    }
    setState(() {
      remainingTime = 10;
    });
    startTimer();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
          if (!gameOverOrNot) {
            if (player1) {
              changePlayer();
              computerMove(); // Computer moves after time runs out
            } else {
              changePlayer();
            }
          }
        }
      });
    });
  }

  void computerMove() {
    if (widget.isSinglePlayer && !gameOverOrNot) {
      if (gameOverOrNot) return;

      // Check if the computer can win
      for (int i = 0; i < values.length; i++) {
        if (values[i] == '') {
          values[i] = 'O';
          if (checkWin(values)) {
            setState(() {
              gameOverOrNot = true;
              msg = "Player 2 Won";
              player2count++;
              saveGameResult(msg);
            });
            return;
          } else {
            values[i] = '';
          }
        }
      }

      // Block Player 1's winning move
      for (int i = 0; i < values.length; i++) {
        if (values[i] == '') {
          values[i] = 'X';
          if (checkWin(values)) {
            setState(() {
              values[i] = 'O';
              changePlayer();
            });
            return;
          } else {
            values[i] = '';
          }
        }
      }

      // If no immediate win or block, take the first available spot
      for (int i = 0; i < values.length; i++) {
        if (values[i] == '') {
          setState(() {
            values[i] = 'O';
            bool gameOver = checkWin(values);

            if (!gameOver && emptyValues(values)) {
              gameOverOrNot = true;
              msg = "It's a Draw";
              saveGameResult(msg);
            }

            if (gameOver) {
              gameOverOrNot = true;
              msg = "Player 2 Won";
              player2count++;
              saveGameResult(msg);
            } else {
              changePlayer();
            }
          });
          break;
        }
      }
    }
  }

  Widget homeButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
          (Route<dynamic> route) => false,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "Home",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget playAgainButton() {
    if (!gameOverOrNot) {
      return const SizedBox.shrink();
    }
    return ElevatedButton(
      onPressed: () {
        setState(() {
          values = List.filled(9, '');
          player1 = true;
          gameOverOrNot = false;
          msg = "";
          resetTimer();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.tealAccent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "Play Again",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }

  Widget restartButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          values = List.filled(9, '');
          player1 = true;
          gameOverOrNot = false;
          msg = "";
          player1count = 0;
          player2count = 0;
          resetTimer();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        "Restart",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }

  @override
  void dispose() {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title,
            style: const TextStyle(color: Colors.tealAccent)),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Player 1: $player1count",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Player 2: $player2count",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  gameOverOrNot
                      ? ""
                      : player1
                          ? "Player 1's Turn"
                          : "Computer's Turn",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  msg,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: gameOverOrNot ? Colors.redAccent : Colors.tealAccent,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Time Left: $remainingTime seconds',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                playAgainButton(),
                const SizedBox(height: 10),
                restartButton(),
              ],
            ),
            const SizedBox(width: 20),
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
                      border: Border.all(color: Colors.tealAccent, width: 2),
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (values[index] == '' && !gameOverOrNot) {
                            if (player1 || !widget.isSinglePlayer) {
                              // Allow both players to make a move in two-player mode
                              values[index] = player1 ? 'X' : 'O';
                              bool gameOver = checkWin(values);

                              if (!gameOver && emptyValues(values)) {
                                gameOverOrNot = true;
                                msg = "It's a Draw";
                              }

                              if (gameOver) {
                                gameOverOrNot = true;
                                msg = player1 ? "Player 1 Won" : "Player 2 Won";
                                player1 ? player1count++ : player2count++;
                                saveGameResult(msg);
                              } else {
                                changePlayer();
                                if (widget.isSinglePlayer) {
                                  computerMove(); // Trigger computer move after Player 1's move
                                }
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
                            color: values[index] == 'X'
                                ? Colors.cyanAccent
                                : Colors.pinkAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  bool emptyValues(List<String> values) {
    for (int i = 0; i < values.length; i++) {
      if (values[i] == '') {
        return false;
      }
    }
    return true;
  }
}



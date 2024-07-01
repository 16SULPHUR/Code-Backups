import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  final String title;

  const TicTacToeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> values = List.filled(9, '');
  bool player1 = true;
  bool won = false;
  bool gameOverMessage = false;
  bool allFull = false;

  void changePlayer() {
    setState(() {
      player1 = !player1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: won
            ? player1
                ? const Text("Player 2 Won")
                : const Text("Player 1 Won")
            : gameOverMessage
                ? const Text("Game Over")
                :
                // style: const TextStyle(fontSize: 24)),
                SizedBox(
                    height: 500,
                    width: 500,
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap:
                          true, // Added this to allow the GridView to occupy the available space
                      children: List.generate(
                        9,
                        (index) => InkWell(
                          onTap: () {
                            setState(() {
                              if (values[index] == '') {
                                changePlayer();
                                values[index] = player1 ? 'X' : 'O';
                              }

                              bool condition1 = values[0] == values[1] &&
                                  values[1] == values[2] &&
                                  values[2] == 'X';
                              bool condition2 = values[3] == values[4] &&
                                  values[4] == values[5] &&
                                  values[5] == 'X';
                              bool condition3 = values[6] == values[7] &&
                                  values[7] == values[8] &&
                                  values[8] == 'X';
                              bool condition4 = values[0] == values[3] &&
                                  values[3] == values[6] &&
                                  values[6] == 'X';
                              bool condition5 = values[1] == values[4] &&
                                  values[4] == values[7] &&
                                  values[7] == 'X';
                              bool condition6 = values[2] == values[5] &&
                                  values[5] == values[8] &&
                                  values[8] == 'X';
                              bool condition7 = values[0] == values[4] &&
                                  values[4] == values[8] &&
                                  values[8] == 'X';
                              bool condition8 = values[2] == values[4] &&
                                  values[4] == values[6] &&
                                  values[6] == 'X';
                              bool condition9 = values[0] == values[1] &&
                                  values[1] == values[2] &&
                                  values[2] == 'O';
                              bool condition10 = values[3] == values[4] &&
                                  values[4] == values[5] &&
                                  values[5] == 'O';
                              bool condition11 = values[6] == values[7] &&
                                  values[7] == values[8] &&
                                  values[8] == 'O';
                              bool condition12 = values[0] == values[3] &&
                                  values[3] == values[6] &&
                                  values[6] == 'O';
                              bool condition13 = values[1] == values[4] &&
                                  values[4] == values[7] &&
                                  values[7] == 'O';
                              bool condition14 = values[2] == values[5] &&
                                  values[5] == values[8] &&
                                  values[8] == 'O';
                              bool condition15 = values[0] == values[4] &&
                                  values[4] == values[8] &&
                                  values[8] == 'O';
                              bool condition16 = values[2] == values[4] &&
                                  values[4] == values[6] &&
                                  values[6] == 'O';

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
                                won = true;
                              }

                              if (values[0] == '' ||
                                  values[1] == '' ||
                                  values[2] == '' ||
                                  values[3] == '' ||
                                  values[4] == '' ||
                                  values[5] == '' ||
                                  values[6] == '' ||
                                  values[7] == '' ||
                                  values[8] == '') {
                                allFull = false;
                              }
                              else{
                                allFull = true;
                              }

                              if (allFull) {
                                gameOverMessage = true;
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                values[index],
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}

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
  bool gameOverMessage = false;

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
        child: Column(
          children: [
            Text(
                gameOverMessage
                    ? 'Game Over'
                    : player1
                        ? "Player 1's Turn"
                        : "Player 2's Turn",
                style: const TextStyle(fontSize: 24)),
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
                        changePlayer();
                        if (values[index] == '') {
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
                            condition8) {
                          gameOverMessage = true;
                        }
                      });
                    },
                    child: Container(
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: Center(
                        child: Text(
                          values[index],
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white),
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
}

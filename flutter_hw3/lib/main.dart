import 'package:flutter/material.dart';
import 'package:flutter_hw3/scoreBlockRow.dart';
import 'package:flutter_hw3/scoreBlock_tile.dart';
import 'package:flutter_hw3/dice.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ScoreBlockRow> scoreBlockRows = [
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
    ScoreBlockRow(0, 0),
  ];
  // row dice related
  final _diceEmojis = ["⚀", "⚁", "⚂", "⚃", "⚄", "⚅"];
  List<bool> _isClickableIndex = [true, true, true, true, true];
  List<bool> _isClicked = [false, false, false, false, false];
  List<int> _diceIndexes = [0, 0, 0, 0, 0];

  var _rowCount = 3;
  var _playerScore = 0;
  var _opponentScore = 0;
  bool _dickClickable = false;
  bool _playBtnClickable = false;

  void _setClickable() {
    setState(() {
      for (int i = 0; i < 5; i++) {
        if (_isClicked[i]) {
          _isClickableIndex[i] = false;
        }
      }
    });
  }

  // score related

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //navigation button(),
                //menu button(),
                Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Column(
                        children: [
                          const Text("player1"),
                          Text(_playerScore.toString()),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text("VS", style: TextStyle(fontSize: 20)),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Text("player2"),
                          Text(_opponentScore.toString()),
                        ],
                      ),
                      const Icon(
                        Icons.account_circle,
                        color: Colors.red,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // section header
            Container(
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
              child: const Row(
                // section title
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Minor",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 120),
                  Text(
                    "Major",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // score blocks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: scoreBlockRows.length,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 10,
                  childAspectRatio: 32 / 9,
                ),
                itemBuilder: (context, index) {
                  return ScoreBlockTile(
                    index: index,
                    scoreBlockRow: scoreBlockRows[index],
                  );
                },
              ),
            ),
            // dice area
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked[0] = !_isClicked[0];
                    });
                  },
                  child: Text(
                    _diceEmojis[_diceIndexes[0]],
                    style: TextStyle(
                      fontSize: 50,
                      color: _isClicked[0] ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked[1] = !_isClicked[1];
                    });
                  },
                  child: Text(
                    _diceEmojis[_diceIndexes[1]],
                    style: TextStyle(
                      fontSize: 50,
                      color: _isClicked[1] ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked[2] = !_isClicked[2];
                    });
                  },
                  child: Text(
                    _diceEmojis[_diceIndexes[2]],
                    style: TextStyle(
                      fontSize: 50,
                      color: _isClicked[2] ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked[3] = !_isClicked[3];
                    });
                  },
                  child: Text(
                    _diceEmojis[_diceIndexes[3]],
                    style: TextStyle(
                      fontSize: 50,
                      color: _isClicked[3] ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked[4] = !_isClicked[4];
                    });
                  },
                  child: Text(
                    _diceEmojis[_diceIndexes[4]],
                    style: TextStyle(
                      fontSize: 50,
                      color: _isClicked[4] ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            // buttons area
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // row button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _setClickable();
                      if (_rowCount > 0) {
                        for (var i = 0; i < 5; i++) {
                          if (_isClickableIndex[i]) {
                            _diceIndexes[i] = Random().nextInt(6);
                          }
                        }
                        _rowCount -= 1;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor:
                        _rowCount > 0 ? Colors.blue : Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      "Row($_rowCount)",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                // play button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _rowCount = 3;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor:
                          _playBtnClickable ? Colors.green : Colors.grey[200]),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      "Play",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

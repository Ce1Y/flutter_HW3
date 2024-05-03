import 'package:flutter/material.dart';
import 'package:flutter_hw3/scoreBlockRow.dart';
import 'package:flutter_hw3/scoreBlock_tile.dart';
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
  final _diceEmojis = ["⚀", "⚁", "⚂", "⚃", "⚄", "⚅"];

  var _diceIndex = 0;
  var _rowCount = 3;
  bool _dickClickable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
              child: const Row(
                // section title
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Minor",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
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
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
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
                Text(
                  _diceEmojis[_diceIndex],
                  style: const TextStyle(
                    fontSize: 45,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  _diceEmojis[_diceIndex],
                  style: const TextStyle(
                    fontSize: 45,
                  ),
                ),
                Text(
                  _diceEmojis[_diceIndex],
                  style: const TextStyle(
                    fontSize: 45,
                  ),
                ),
                Text(
                  _diceEmojis[_diceIndex],
                  style: const TextStyle(
                    fontSize: 45,
                  ),
                ),
                Text(
                  _diceEmojis[_diceIndex],
                  style: const TextStyle(
                    fontSize: 45,
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
                      if (_rowCount > 0) {
                        _diceIndex = Random().nextInt(6);
                        _rowCount -= 1;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    foregroundColor:
                        _rowCount > 0 ? Colors.black : Colors.grey[600],
                    backgroundColor:
                        _rowCount > 0 ? Colors.blue : Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      "Row($_rowCount)",
                      style: TextStyle(fontSize: 20),
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
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      "Play",
                      style: TextStyle(fontSize: 20),
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

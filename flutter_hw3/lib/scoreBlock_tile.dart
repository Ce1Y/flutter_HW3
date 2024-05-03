import 'package:flutter/material.dart';
import 'package:flutter_hw3/scoreBlockRow.dart';
import 'package:flutter_hw3/scorecard.dart';

class ScoreBlockTile extends StatefulWidget {
  ScoreBlockTile({
    super.key,
    required this.index,
    required this.scoreBlockRow,
  });

  final int index;
  final ScoreBlockRow scoreBlockRow;

  @override
  State<ScoreBlockTile> createState() => _ScoreBlockTile();
}

class _ScoreBlockTile extends State<ScoreBlockTile> {
  bool _isClicked = false;
  bool _isClicked2 = false;
  Map<String, int> section = {
    "⚀": 1,
    "3x": 0,
    "⚁": 2,
    "4x": 0,
    "⚂": 3,
    "FH": 25,
    "⚃": 4,
    "SS": 30,
    "⚄": 5,
    "LS": 40,
    "⚅": 6,
    "Ya": 50,
    "35": 35,
    "CH": 0,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // find key through index
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            section.keys.elementAt(widget.index),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // player score block
        GestureDetector(
          onTap: () {
            setState(() {
              _isClicked = !_isClicked;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            color: _isClicked ? Colors.green[400] : Colors.green[100],
            child: Text(
              widget.scoreBlockRow.getScore(),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // opponent score block
        GestureDetector(
          onTap: () {
            setState(() {
              _isClicked2 = !_isClicked2;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            color: _isClicked2 ? Colors.amber : Colors.green[100],
            child: Text(
              widget.scoreBlockRow.getOpponentScore(),
            ),
          ),
        ),
      ],
    );
  }
}

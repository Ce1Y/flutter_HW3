import 'package:flutter/material.dart';
import 'package:flutter_hw3/scoreBlockRow.dart';

class ScoreBlockTile extends StatefulWidget {
  const ScoreBlockTile({
    super.key,
    required this.index,
    required this.round,
    required this.scoreBlockRow,
    required this.onPressed,
  });

  final int index;
  final int round;
  final ScoreBlockRow scoreBlockRow;
  final VoidCallback onPressed;

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
    "Full House": 25,
    "⚃": 4,
    "Small Straight": 30,
    "⚄": 5,
    "Large Straight": 40,
    "⚅": 6,
    "Yahtzee": 50,
    "Bonus +35": 35,
    "Chance": 0,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // find key through index
        Container(
          alignment: Alignment.center,
          width: 50,
          child: Text(
            section.keys.elementAt(widget.index),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSizeJudge(section.keys.elementAt(widget.index)),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // player score block
        GestureDetector(
          // onTap: widget.onPressed,
          onTap: () {
            widget.onPressed();
            setState(() {
              _isClicked = !_isClicked;
              if (widget.round % 2 == 1) {
                print("round = player");
              } else {
                print("round = opponent");
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            color: _isClicked ? Colors.blue[400] : Colors.green[100],
            child: Text(
              widget.scoreBlockRow.getScore(),
              style: const TextStyle(fontSize: 20),
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
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

double fontSizeJudge(String category) {
  if (category == "⚀" ||
      category == "⚁" ||
      category == "⚂" ||
      category == "⚃" ||
      category == "⚄" ||
      category == "⚅") {
    return 25;
  } else if (category == "3x" || category == "4x") {
    return 20;
  } else {
    return 13;
  }
}

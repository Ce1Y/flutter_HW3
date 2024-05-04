import 'package:flutter/material.dart';
import 'package:flutter_hw3/scoreBlockRow.dart';

class ScoreBlockTile extends StatefulWidget {
  ScoreBlockTile({
    super.key,
    required this.index,
    required this.round,
    required this.rowTimes,
    required this.scoreBlockRow,
    required this.isPlayerClicked,
    required this.isOpponentClicked,
    required this.onPressed,
  });

  final int index;
  final int round;
  final int rowTimes;
  final ScoreBlockRow scoreBlockRow;
  bool isPlayerClicked;
  bool isOpponentClicked;
  final VoidCallback onPressed;

  @override
  State<ScoreBlockTile> createState() => _ScoreBlockTile();
}

class _ScoreBlockTile extends State<ScoreBlockTile> {
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
  void initState() {
    super.initState();
    widget.isPlayerClicked = false;
    widget.isOpponentClicked = false;
  }

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
          // The game just started, the block cannot be clicked
          onTap: widget.rowTimes == 3
              ? null
              : () {
                  widget.onPressed();
                  setState(() {
                    widget.isPlayerClicked = !widget.isPlayerClicked;
                    print(widget.isPlayerClicked);
                    print(widget.rowTimes);
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
            color: widget.isPlayerClicked && widget.rowTimes != 3
                ? Colors.blue
                : Colors.green[100],
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
          onTap: widget.rowTimes == 3
              ? null
              : () {
                  setState(() {
                    widget.isOpponentClicked = !widget.isOpponentClicked;
                  });
                },
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            color: widget.isOpponentClicked && widget.rowTimes != 3
                ? Colors.amber
                : Colors.green[100],
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

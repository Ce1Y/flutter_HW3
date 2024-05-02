import 'package:flutter/material.dart';
import 'package:flutter_hw3/scoreBlock.dart';

class ScoreBlockTile extends StatefulWidget {
  ScoreBlockTile({super.key, required this.scoreBlock});

  final ScoreBlock scoreBlock;

  @override
  State<ScoreBlockTile> createState() => _ScoreBlockTile();
}

class _ScoreBlockTile extends State<ScoreBlockTile> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        color: _isClicked ? Colors.green[400] : Colors.green[100],
        child: Text(
          widget.scoreBlock.getScore(),
          // scoreBlock.getScore(),
        ),
      ),
    );
  }
}

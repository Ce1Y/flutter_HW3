import 'package:flutter/material.dart';
import 'package:flutter_hw3/scoreBlock.dart';

class ScoreBlockTile extends StatefulWidget {
  ScoreBlockTile({super.key, required this.scoreBlock, required this.section});

  final ScoreBlock scoreBlock;
  final String section;

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
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                color: _isClicked ? Colors.green[400] : Colors.green[100],
                child: Text(
                  widget.scoreBlock.getScore(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                color: _isClicked ? Colors.green[400] : Colors.green[100],
                child: Text(
                  widget.scoreBlock.getScore(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hw3/scoreBlock.dart';
import 'package:flutter_hw3/scoreBlock_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
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
  List<ScoreBlock> scoreBlocks = [
    ScoreBlock(score: 0),
    ScoreBlock(score: 1),
    ScoreBlock(score: 2),
    ScoreBlock(score: 3),
    ScoreBlock(score: 4),
    ScoreBlock(score: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Yahtzee",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 100,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: scoreBlocks.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return ScoreBlockTile(scoreBlock: scoreBlocks[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

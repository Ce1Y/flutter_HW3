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
    ScoreBlock(score: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: Container(
        //   padding: const EdgeInsets.all(5),
        //   alignment: Alignment.topCenter,
        //   margin: const EdgeInsets.symmetric(horizontal: 10),
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //     color: Colors.grey,
        //   ),
        //   // height: 520,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 235, 59, 1),
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
            // score blocks
            // Row(
            //   children: [
            // Expanded(
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: scoreBlocks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 6 / 1,
                ),
                itemBuilder: (context, index) {
                  return ScoreBlockTile(
                    scoreBlock: scoreBlocks[index],
                    section: "upper",
                  );
                },
              ),
              // major blocks
              // Expanded(
              //   child: GridView.builder(
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: scoreBlocks.length,
              //     gridDelegate:
              //         const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 1,
              //       mainAxisSpacing: 10,
              //       crossAxisSpacing: 10,
              //       childAspectRatio: 1.0,
              //     ),
              //     itemBuilder: (context, index) {
              //       return ScoreBlockTile(
              //         scoreBlock: scoreBlocks[index],
              //         section: "lower",
              //       );
              //     },
              //   ),
              // ),
            ),
            // )
          ],
          //   ),
          // ],
        ),
      ),
      // ),
    );
  }
}

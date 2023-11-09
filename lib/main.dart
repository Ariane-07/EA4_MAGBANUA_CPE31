import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Enabling Assessment 4"),
        centerTitle: true,
      ),
      body: Dice(),
    ),
  ));
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int left = 1;
  int right = 1;
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                MaterialButton(
                  child: Image.asset('images/dice$left.png',
                      height: 150, width: 150),
                  onPressed: () {
                    rollDice();
                  },
                ),
                Text(
                  "Left",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                MaterialButton(
                  child: Image.asset(
                    'images/dice$right.png',
                    height: 150,
                    width: 150,
                  ),
                  onPressed: () {
                    rollDice();
                  },
                ),
                Text(
                  "right",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          result,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
  void rollDice() {
    setState(() {
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);
      if (left > right) {
        result = "Left Wins";
      } else if (right > left) {
        result = "Right Wins";
      } else {
        result = "Draw";
      }
    });
  }
}



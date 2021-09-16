import 'dart:math';

import 'package:dicee_roller/data/images_list.dart';
import 'package:flutter/material.dart';

class DiceRoller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Dice Roller"),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 20,
        shadowColor: Colors.orange.shade500,
      ),
      body: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice;
  int rightDice;
  var rightTires;
  var leftTries;
  Random random = new Random();
  @override
  void initState() {
    leftDice=5;
    rightDice=2;
    rightTires=1;
    leftTries=1;
    super.initState();
  }

  void rightRandomNumber(){
    rightDice=random.nextInt(6)+1;

  }
  void leftRandomNumber(){

    leftDice=random.nextInt(6)+1;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  leftRandomNumber();
                });
              },
              child: Image.asset("assets/images/dice$leftDice.png"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
               setState(() {
                 rightRandomNumber();
               });
              },
              child: Image.asset("assets/images/dice$rightDice.png"),
            ),
          ),
        ],
      ),
    );
  }
}

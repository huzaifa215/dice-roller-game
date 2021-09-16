import 'dart:math';
import 'package:dicee_roller/data/images_list.dart';
import 'package:dicee_roller/screens/result_screen.dart';
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
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "Let's Play Lucky Dice",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  height: 2,
                  wordSpacing: 3),
            ),
            SizedBox(
              height: 100,
            ),
            DicePage(),
          ],
        ));
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
  int totalRightDice = 0;
  int totalLeftDice = 0;
  String winnerName;
  var leftTries;
  Random random = new Random();

  @override
  void initState() {
    leftDice = 5;
    rightDice = 2;
    rightTires = 1;
    leftTries = 1;
    super.initState();
  }

  void rightRandomNumber() {
    rightDice = random.nextInt(6) + 1;
  }

  void leftRandomNumber() {
    leftDice = random.nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
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
                    leftDiceList.add(leftDice);
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
                    rightDiceList.add(rightDice);
                  },
                  child: Image.asset("assets/images/dice$rightDice.png"),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Player 1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 3,
                ),
              ),
              Text(
                "Player 2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 3,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                leftDice.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 3,
                ),
              ),
              Text(
                rightDice.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 3,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: FlatButton(
              onPressed: () {
                rightDiceList.forEach((element) {
                  totalRightDice += element;
                });
                leftDiceList.forEach((element) {
                  totalLeftDice += element;
                });
                if (totalLeftDice > totalRightDice) {
                  winnerName = "Player 1";
                } else {
                  winnerName = "Player 2";
                }
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      winnerName: winnerName,
                      totalLeft: totalLeftDice,
                      totalRight: totalRightDice,
                    ),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                "Show Result",
                style: TextStyle(color: Colors.red, fontSize: 18),
              )),
        ),
      ],
    );
  }
}

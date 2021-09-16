import 'package:dicee_roller/data/images_list.dart';
import 'package:dicee_roller/screens/dice_roller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final winnerName;
  final totalRight;
  final totalLeft;

  const ResultScreen(
      {Key key, this.winnerName, this.totalRight, this.totalLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 20,
        shadowColor: Colors.orange.shade500,
      ),
      body: ResultPage(
        winnerName: winnerName,
        totalRight: totalRight,
        totalLeft: totalLeft,
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final winnerName;
  final totalRight;
  final totalLeft;

  const ResultPage({Key key, this.winnerName, this.totalRight, this.totalLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Hurrah Image ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                height: 2,
                wordSpacing: 3),
          ),
        ),
        Text(
          winnerName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 4,
          ),
        ),
        WinnerResult(
          totalLeft: totalLeft,
          totalRight: totalRight,
        ),
      ],
    );
  }
}

class WinnerResult extends StatelessWidget {
  final totalRight;
  final totalLeft;

  const WinnerResult({Key key, this.totalRight, this.totalLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Player 1 Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                height: 4,
              ),
            ),
            Text(
              "Player 2 Data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                height: 4,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            leftDiceList[index].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            rightDiceList[index].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Total Points:  $totalLeft",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 3,
              ),
            ),
            Text(
              "Total Points:  $totalRight",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 3,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiceRoller(),
                  ),
                );
              },
              child: Text(
                "Play Again",
                style: TextStyle(color: Colors.red, fontSize: 18),
              )),
        ),
      ],
    );
  }
}

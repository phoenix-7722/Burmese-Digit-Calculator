import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget customOutlineButton(String a) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20.0),
        onPressed: () => buttonClicked(a),
        child: Text(
          "$a",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey[100],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  String result;
  String text = "";
  int first, second;
  String opp;
  void buttonClicked(String buttonText) {
    if (buttonText == "ရှင်းရန်") {
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      first = int.parse(text);
      result = "";
      opp = buttonText;
    } else if (buttonText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        result = (first + second).toString();
      }
      if (opp == "-") {
        result = (first - second).toString();
      }
      if (opp == "x") {
        result = (first * second).toString();
      }
      if (opp == "/") {
        result = (first ~/ second).toString();
      }
    } else {
      result = int.parse(text + buttonText).toString();
    }
    setState(() {
      text = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          "မြန်မာဂဏန်းတွက်စက်",
          style: TextStyle(
            color: Colors.yellow[500],
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 40.0),
        child: ListView(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: 10.0, right: 40.0, top: 320.0, bottom: 20.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.yellow[400],
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customOutlineButton("၉"),
                customOutlineButton("၈"),
                customOutlineButton("၇"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("၆"),
                customOutlineButton("၅"),
                customOutlineButton("၄"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("၃"),
                customOutlineButton("၂"),
                customOutlineButton("၁"),
                customOutlineButton("x"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("ရှင်းရန်"),
                customOutlineButton("၀"),
                customOutlineButton("="),
                customOutlineButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

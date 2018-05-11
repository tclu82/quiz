import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {

  final String _quesiton;

  final int _questionNumber;

  QuestionText(this._quesiton, this._questionNumber);

  @override
  State<StatefulWidget> createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        // Not EdgeInsets.all, only symmetric in vertical
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text(
            "Statement " + widget._questionNumber.toString() + ": " + widget._quesiton,
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

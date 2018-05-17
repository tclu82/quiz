import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;

  final VoidCallback _onTap;
  // Pass "print" to the callback function when Construct
  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: _answer ? Colors.yellow : Colors.purple,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              // Border for Text
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 5.0)
              ),
              // Padding gap 20.0 between text and border
              padding: new EdgeInsets.all(20.0),

              child: new Text(_answer ? "True" : "False", style: new TextStyle(
                color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic
              ),),
            ),
          ),
        ),
      ),
    );
  }
}

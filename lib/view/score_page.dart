import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget {

  final int _score;

  final int _totalQuestions;

  ScorePage(this._score, this._totalQuestions);

  @override
    Widget build(BuildContext context) {
      return new Material(
        color: Colors.blueAccent,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Your score: ", style: new TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
            new Text(_score.toString() + "/" + _totalQuestions.toString(), style: new TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
            new IconButton(
              icon: new Icon(Icons.arrow_right),
              color: Colors.white,
              iconSize: 50.0,
              // When route = null, stop push and remove route
              onPressed: () => Navigator.of(context)
              .pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), 
              (Route route) => route == null),
            )
          ],
        ),
      );
    }
}
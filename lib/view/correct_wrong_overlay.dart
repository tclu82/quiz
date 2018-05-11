import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {

  final bool _isCorrect;

  CorrectWrongOverlay(this._isCorrect);

  @override
    State<StatefulWidget> createState() {
      return new CorrectWrongOverlayState();
    }
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> {
  @override
    Widget build(BuildContext context) {

      return new Material(
        color: Colors.black54,
        child: new InkWell(
          onTap: () => print("You tap the overlay"),
          child: new Column(
            
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              new Container(
                // Box arond "Icons.done"
                decoration: new BoxDecoration(color: Colors.white, shape: BoxShape.circle),

                child: new Icon(widget._isCorrect ? Icons.done : Icons.clear, size: 80.0,),
              ),
              new Text(widget._isCorrect ? "Correct!" : "Wrong!", style: new TextStyle(fontSize: 20.0, color: Colors.white),)
            ],
          ),
        ),
      );

      
    }
}
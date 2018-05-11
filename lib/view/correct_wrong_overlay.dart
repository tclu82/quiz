import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {

  final bool _isCorrect;

  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
    State<StatefulWidget> createState() {
      return new CorrectWrongOverlayState();
    }
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;

  AnimationController _iconAnimationController;

  @override
    void initState() {
      super.initState();
      _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
      _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
      _iconAnimationController.addListener(() => this.setState(() => {}));
      _iconAnimationController.forward();
    }

  @override
    Widget build(BuildContext context) {

      return new Material(
        color: Colors.black54,
        child: new InkWell(
          onTap: () => widget._onTap(),
          child: new Column(
            
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              new Container(
                // Box arond "Icons.done"
                decoration: new BoxDecoration(
                  color: Colors.white, 
                  shape: BoxShape.circle
                ),

                child: new Transform.rotate(
                  angle: _iconAnimation.value * 2 * PI, // 0, 0.1, 0.2, ..., 1
                  child: new Icon(widget._isCorrect ? Icons.done : Icons.clear, size: 80.0 * _iconAnimation.value,),),
              ),

              new Padding(padding: new EdgeInsets.only(bottom: 20.0),),

              new Text(widget._isCorrect ? "Correct!" : "Wrong!", style: new TextStyle(fontSize: 20.0, color: Colors.white),)
            ],
          ),
        ),
      );

      
    }
}
import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {

  final String _quesiton;

  final int _questionNumber;

  QuestionText(this._quesiton, this._questionNumber);

  @override
  State<StatefulWidget> createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {
  // 0, 0.1, 0.2, ..., 1
  Animation<double> _fontSizeAnimation;  

  AnimationController _fontSizeAnimationController;

  @override
    void initState() {
      super.initState();

      _fontSizeAnimationController = 
      new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);

      _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceOut);
      _fontSizeAnimation.addListener(() => this.setState(() => {}));
      _fontSizeAnimationController.forward();
    }

  // Restart the animate for next question
  @override
    void didUpdateWidget(QuestionText oldWidget) {
      super.didUpdateWidget(oldWidget);

      if (oldWidget._quesiton != widget._quesiton) {
        _fontSizeAnimationController.reset();
        _fontSizeAnimationController.forward();
      }
    }


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
            // update font size with the animation
            style: new TextStyle(fontSize: _fontSizeAnimation.value * 15),
          ),
        ),
      ),
    );
  }
}

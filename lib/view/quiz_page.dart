import 'package:flutter/material.dart';
import '../model/question.dart';
import '../model/quiz.dart';
import './answer_button.dart';
import './question_text.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            // Callback function style 1
            new AnswerButton(true, () => print("That's right!!")),
            new QuestionText("Programming is fun?", 1),
            // Callback function style 2
            new AnswerButton(false, () { print("Booooooooo!!"); })
          ],
        )
      ],
    );
  }
}

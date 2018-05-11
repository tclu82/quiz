import 'package:flutter/material.dart';
import '../model/question.dart';
import '../model/quiz.dart';
import './answer_button.dart';
import './question_text.dart';
import './correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuizPageState();
  }
}

class QuizPageState extends State<QuizPage> {
  Question _currentQuestion;

  Quiz _quiz = new Quiz([
    new Question("No rain in Seattle?", false),
    new Question("Flutter is dope?", true),
    new Question("Shool is boring?", false),
    new Question("Learning is fun?", true),
  ]);

  String _questionText;

  int _questionNumber;

  bool _isCorrect;

  bool _overlayShouldVisible;

  @override
  void initState() {
    super.initState();

    _currentQuestion = _quiz.nextQuestion;
    _questionText = _currentQuestion.question;
    _questionNumber = _quiz.questionNumer;
    _overlayShouldVisible = false;
  }

  void handleAnswer(bool answer) {
    _isCorrect = answer == _currentQuestion.answer;
    // Update score
    _quiz.answer(_isCorrect);
    this.setState((() {
      _overlayShouldVisible = true;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            // Callback function style 1
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(_questionText, _questionNumber),
            // Callback function style 2
            new AnswerButton(false, () {
              handleAnswer(false);
            })
          ],
        ),
        _overlayShouldVisible ? new CorrectWrongOverlay(_isCorrect, () {
          // Answer all questions
          if (_quiz.length == _questionNumber) {
            Navigator.of(context) // When route = null, stop push and remove route
            .pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(_quiz.score, _quiz.length)), 
            (Route route) => route == null);
            return;
          }

          _currentQuestion = _quiz.nextQuestion;
        
          this.setState(() {
            _overlayShouldVisible = false;
            _questionText = _currentQuestion.question;
            _questionNumber = _quiz.questionNumer;
          });

        }): new Container(),
      ],
    );
  }
}

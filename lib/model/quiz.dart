import './question.dart';

class Quiz {
  // _variableName makes it "private" to avoid accidentally change
  List<Question> _questions;

  int _currentQuestionIndex;
  
  int _score;

  Quiz(this._questions) {
    this._currentQuestionIndex = -1;
    this._score = 0;
    _questions.shuffle();
  }
 
  // Getter method
  int get score => _score;
  List<Question> get questions => _questions;
  int get questionNumer => _currentQuestionIndex + 1;
  int get length => _questions.length;

  Question get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= _questions.length) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}

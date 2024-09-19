// ignore_for_file: unused_element, prefer_final_fields, unused_field

import 'question.dart';

int _questionsNumber = 0;

class Questionbrain {
  List<Question> _questionbank = [
    Question(q: 'What is The Number Of dogs', a: true),
    Question(q: 'What is The Number Of dogss', a: false),
    Question(q: 'How many Dogs are in the room', a: false),
    Question(q: 'How Many', a: false),
    Question(q: 'How Much Does it Cost', a: true),
    Question(q: 'Yoyo', a: false),
    Question(q: 'Yoyo2', a: false),
    Question(q: 'Yoyo3', a: false),
    Question(q: 'Yoyo4', a: false),
  ];

  String getQuestionText() {
    return _questionbank[_questionsNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionbank[_questionsNumber].questionAnswer;
  }

  int GetListLenght() {
    return _questionbank.length;
  }

  void NextQuestion() {
    if (_questionsNumber == GetListLenght() - 1) {
      _questionsNumber = 0;
    } else {
      _questionsNumber++;
    }
  }
}

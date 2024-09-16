// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/Button.dart';
import 'question.dart';

void main() => runApp(Quizzler());

// Test First Push
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  bool isSelected = false;
  //test
  int questionsNumber = 0;
  List<Question> questionbank = [
    Question(q: 'What is The Number Of dogs', a: true),
    Question(q: 'What is The Number Of dogss', a: false),
    Question(q: 'How many Dogs are in the room', a: false),
    Question(q: 'How Many', a: false),
    Question(q: 'How Much Does it Cost', a: true),
    Question(q: 'Yoyo', a: false),
  ];
  List<bool> TotalAnswers = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 3, blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // CustomButton(),
            Text(
              "Choose Between True Or False",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            //Questions Text

            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    questionbank[questionsNumber].questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            // True
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: MaterialButton(
                  elevation: 5,
                  textColor: Colors.white,
                  color: isSelected ? Colors.green : Colors.black,
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    //Correct Answer Check
                    bool correctanswer =
                        questionbank[questionsNumber].questionAnswer;

                    if (correctanswer == true) {
                      print('User Got It Right');
                      TotalAnswers.add(true);
                      print(TotalAnswers);
                    } else {
                      print('User Got It Wrong');
                      TotalAnswers.add(false);
                      print(TotalAnswers);
                    }

                    setState(() {
                      int ListLength = questionbank.length - 1;
                      if (questionsNumber == ListLength) {
                        questionsNumber = 0;
                        print('First Question');
                      } else {
                        print(ListLength);
                        questionsNumber++;
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      }
                    });
                  },
                ),
              ),
            ),
            //False
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: MaterialButton(
                  color: Colors.red,
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    bool correctanswer =
                        questionbank[questionsNumber].questionAnswer;

                    if (correctanswer == true) {
                      print('User Got It Right');
                    } else {
                      print('User Got It Wrong');
                    }
                    setState(() {
                      int ListLength = questionbank.length - 1;
                      if (questionsNumber == ListLength) {
                        questionsNumber = 0;
                        print('First Question');
                      } else {
                        print(ListLength);
                        questionsNumber++;
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      }
                    });
                  },
                ),
              ),
            ),
            //CLear
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: MaterialButton(
                  color: Colors.grey,
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      scoreKeeper.clear();
                    });
                  },
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}

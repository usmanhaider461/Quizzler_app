import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'quiz_brain.dart';

QuizBrain quizBrain  = QuizBrain();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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
  List <Icon> scoreKeeper = [];
  // List<String> question = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  void loveCalculator(){
    int loveScore = Random().nextInt(100);
    print(loveScore);
  }
  // Question q1 = Question(q: 'You can lead a cow down stairs but not up stairs.', a: false);
  // List<bool> answer = [false, true, true];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                 quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),

              ),
              onPressed: (){
                loveCalculator();
                bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                if(correctAnswer == true){
                  print('User got it right.');
                } else print('user got it wrong');
                setState(() {
                  scoreKeeper.add(
                    Icon(Icons.check,
                      color: Colors.green,),
                  );
                  questionNumber++;
                });

              },
            )
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: (){
                  bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                  if(correctAnswer == false){
                    print('User got it right.');
                  } else print('user got it wrong');
                  setState(() {
                    scoreKeeper.add(
                      Icon(Icons.close,
                        color: Colors.red,),
                    );
                    questionNumber++;
                  });
                },
              )
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

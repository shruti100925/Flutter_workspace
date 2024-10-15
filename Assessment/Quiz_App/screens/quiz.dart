import 'package:flutter/material.dart';

import '../Quizscreen/quiz1.dart';
import '../Quizscreen/result.dart';


void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': 0},
        {'text': 'Adobe', 'score': 0},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': 0},
      ],
    },
    {
      'questionText': 'What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': 0},
        {'text': 'Web Development Kit', 'score': 0},
        {'text': 'SDK for mobile, web, and desktop apps', 'score': 10},
        {'text': 'IOS Development Kit', 'score': 0},
      ],
    },
    {
      'questionText': 'Which language is used by Flutter?',
      'answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': 0},
        {'text': 'Python', 'score': 0},
      ],
    },
    {
      'questionText': 'Which of the following platforms is NOT supported by Flutter?',
      'answers': [
        {'text': 'IOS', 'score': 0},
        {'text': 'Android', 'score': 0},
        {'text': 'Web', 'score': 0},
        {'text': 'Nintendo Switch', 'score': 10},
      ],
    },

    {
      'questionText': 'How does Flutter achieve high performance in rendering?',
      'answers': [
        {'text': 'Using WebView', 'score': 0},
        {'text': 'Using a JavaScript engine', 'score': 0},
        {'text': 'Using Skia for rendering', 'score': 10},
        {'text': 'Using native device widgets', 'score': 0},
      ],
    },

  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  bool _showFeedback = false; // To track whether feedback is being shown
  String _feedbackText = ''; // To show Correct or Wrong

  void _answerQuestion(int score)
  {
    if (score > 0) {
      _feedbackText = 'Correct!';
    } else {
      _feedbackText = 'Wrong!';
    }

    _totalScore += score;
    setState(() {
      _showFeedback = true; // Show feedback before moving to next question
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _questionIndex = _questionIndex + 1;
        _showFeedback = false; // Stop showing feedback
      });
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _showFeedback = false;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ?  Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
          showFeedback: _showFeedback,  // Pass whether feedback is shown
          feedbackText: _feedbackText,  // Pass the feedback text
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

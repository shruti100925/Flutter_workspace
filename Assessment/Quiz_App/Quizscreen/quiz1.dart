import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final bool showFeedback;
  final String feedbackText;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
    required this.showFeedback,
    required this.feedbackText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(
                () => answerQuestion(answer['score']),
            answer['text'] as String,
          );
        }).toList(),

        SizedBox(height: 20),

        // Show feedback below the question and answers
        if (showFeedback)
          Text(
            feedbackText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: feedbackText == 'Correct!' ? Colors.green : Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}

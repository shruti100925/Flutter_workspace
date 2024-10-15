import 'package:flutter/material.dart';

class ReadQuestionsScreen extends StatelessWidget {
  final List<Map<String, Object>> questions = const [
    {
      'questionText': 'Who created Flutter?',
      'answers': ['Facebook', 'Adobe', 'Google', 'Microsoft'],
    },
    {
      'questionText': 'What is Flutter?',
      'answers': [
        'Android Development Kit',
        'Web Development Kit',
        'SDK for mobile, web, and desktop apps',
        'iOS Development Kit',
      ],
    },
    {
      'questionText': 'Which language is used by Flutter?',
      'answers': ['Java', 'Dart', 'C++', 'Python'],
    },
    {
      'questionText': 'Which of the following platforms is NOT supported by Flutter?',
      'answers': ['IOS', 'Android', 'Web', 'Nintendo Switch'],
    },
    {
      'questionText': 'How does Flutter achieve high performance in rendering?',
      'answers': ['Using WebView', 'Using a JavaScript engine', 'Using Skia for rendering', 'Using native device widgets'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Questions'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ${questions[index]['questionText']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ...(questions[index]['answers'] as List<String>).map((answer) {
                    return Text('- $answer', style: TextStyle(fontSize: 18));
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

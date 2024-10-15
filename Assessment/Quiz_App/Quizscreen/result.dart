import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;


  Result(this.totalScore, this.resetQuiz);

  late FlutterTts flutterTts=FlutterTts();

  String a="";

  late String resultText;

  String get resultPhrase
  {

    if (totalScore >= 20)
    {
      resultText = 'You did it! Excellent! \n $totalScore/50';
      speak();

    }
    else if (totalScore >= 10)
    {
      resultText = 'Pretty good!  \n $totalScore/50';
      speak();
    }
    else
    {
      resultText = 'You need to work more!  \n $totalScore/50';
      speak();
    }
    return resultText;

  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetQuiz,
            child: Text('Restart Quiz!'),
          )
        ],
      ),
    );
  }

  void speak() async
  {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.6);
    await flutterTts.setPitch(0.6);

    if(resultText!=null)
    {
      if(resultText!.isNotEmpty)
      {
        await flutterTts.speak(resultText!);
      }
    }


  }
}

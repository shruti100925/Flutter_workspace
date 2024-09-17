import 'package:flutter/material.dart';

class Textviewaroundimages extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programming Languages'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top Image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/andriod.png',
                    width: 75,
                    height: 100,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left Image
                  Image.asset(
                    'images/phython.jpeg',
                    width: 75,
                    height: 100,
                  ),
                  // TextView
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Programming Languages',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  // Right Image
                  Image.asset(
                    'images/java.png',
                    width: 75,
                    height: 100,
                  ),
                ],
              ),
              // Bottom Image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/swift.png',
                    width: 75,
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
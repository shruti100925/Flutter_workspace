import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "About Quiz Game",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to the Interview Questions Quiz Game! This app is designed to help users prepare for technical and HR interviews by providing a wide range of questions across various domains.",
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                "Key Features:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              _buildFeatureItem("1. Technical Interview Questions on languages like Java, Python, C++."),
              _buildFeatureItem("2. Data Structures and Algorithms challenges."),
              _buildFeatureItem("3. HR Interview Questions."),
              _buildFeatureItem("4. Time-bound quizzes to simulate real interview pressure."),
              _buildFeatureItem("5. Performance tracking and progress reports."),
              SizedBox(height: 20),
              Text(
                "Our Mission:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Our goal is to provide a comprehensive and engaging way for candidates to practice and prepare for their upcoming interviews. With our quiz game, you can sharpen your skills and boost your confidence for any technical or HR interview.",
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
              SizedBox(height: 20),
             
              SizedBox(height: 10),
              Text(
                "If you have any questions or feedback, feel free to reach out to us at support@quizgame.com.",
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Back to Home",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create feature list items
  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_circle,
            color: Colors.deepPurple,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              feature,
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

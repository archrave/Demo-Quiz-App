import 'package:flutter/material.dart';
import './quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, Object>> homeQuestions;
  HomeScreen(this.homeQuestions);

  void loadQuiz(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return QuizScreen(homeQuestions);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            child: Center(
              child: Image.asset(
                'images/domo_logo.png',
                width: 100,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Available Quiz',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            width: 360,
            height: 80,
            child: RaisedButton(
              elevation: 5,
              color: Color(0xFFF6F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Row(
                children: [
                  Image.asset('images/024_logo.png'),
                  Text('Submit'),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

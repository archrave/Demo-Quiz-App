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
            width: 330,
            height: 85,
            child: RaisedButton(
                elevation: 5,
                color: Color(0xFFF6F5F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Row(
                  children: [
                    // Text(
                    //   'ddfad',
                    //   style: TextStyle(fontSize: 20),
                    // ),
                    Image.asset(
                      'images/024quiz_logo.png',
                      scale: 0.80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Number System',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            'Difficulty: Basic',
                            style: TextStyle(fontSize: 8),
                          ),
                          Row(
                            children: [
                              Text(
                                '100',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.green),
                              ),
                              Text(
                                ' /20,000+ Questions',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                onPressed: () => loadQuiz(context)),
          ),
          SizedBox(height: 350),
          Container(
              width: 260,
              height: 55,
              child: RaisedButton(
                onPressed: () => loadQuiz(context),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text('Instant Quiz',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              )),
          SizedBox(height: 30),
          Text(
            'Candidate ID: Divyansh_divyanshjoshi20@gmail.com',
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}

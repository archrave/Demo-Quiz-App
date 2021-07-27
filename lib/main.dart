import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _questions = const [
    // This is a list of maps, each map contains two keys here
    {
      'questionText1': 'Find the missing number in series',
      'questionText2': '8, ?, -4, -10, -16, -22?',
      'answers': [0, -1, -3, -2],
      'correctAns': -2,
    },
    {
      'questionText1': 'Find the missing number in series',
      'questionText2': '75, 143, 279, 551, ?, 2183',
      'answers': [640, 780, 980, 1095],
      'correctAns': 1095,
    }
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domo Quiz',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Color(0xFFF6F5F5),
          textTheme: TextTheme(
            title: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            body1: TextStyle(fontSize: 24),
            body2: TextStyle(fontSize: 14),
          )),
      home: HomeScreen(_questions),
    );
  }
}

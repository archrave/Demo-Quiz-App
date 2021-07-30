import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import './widgets/get_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List<Map<String, dynamic>> _questions = [];
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domo Quiz',
      theme: ThemeData(
          primaryColor: Color(0xFF53CE34),
          accentColor: Color(0xFFF6F5F5),
          canvasColor: Colors.white,
          errorColor: Color(0xFFEC8308),
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
                body1: TextStyle(fontFamily: 'Roboto', fontSize: 24),
                body2: TextStyle(fontFamily: 'Roboto', fontSize: 14),
              )),
      home: HomeScreen(
        _questions,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: HomeScreen(),
    );
  }
}

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
  List<Map<String, Object>> _newQues;

  Future<void> fetchQuestions() async {
    var url =
        Uri.parse('http://perceptiondraft.com//api//gbas00721-quiz.php?cid=1');
    try {
      final response = await http.get(url);
      final extractedData = (json.decode(response.body));
      List<Map<String, dynamic>> newQuestions = [];
      extractedData.forEach((element) {
        newQuestions.add({
          'questionText1': element['q'].split(new RegExp(r"[:]"))[0],
          'questionText2': element['q'].split(new RegExp(r"[:]"))[1],
          'answers': [
            element['o1'],
            element['o2'],
            element['o3'],
            element['o4']
          ],
          'correctAns': element['co'],
        });
      });
      _newQues = newQuestions;
      print(_newQues);
      print(_newQues.runtimeType);
    } catch (error) {
      throw (error);
    }
  }

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
  //final _questions = const
  List<Map<String, Object>> hardCodedQuestions = const [
    {
      'questionText1': 'Find the missing number in series',
      'questionText2': '58, 116, ?, 232, 290, 348',
      'answers': [165, 174, 211, 169],
      'correctAns': 174
    },
    {
      'questionText1': 'Find the missing number in series',
      'questionText2': '15, 30, ?, 45, 45, 60, 60',
      'answers': [30, 37, 30, 44],
      'correctAns': 30
    },
    {
      'questionText1': 'Find the missing number in series',
      'questionText2': '56, 102, 194, 378, ?, 1482',
      'answers': [746, 434, 1472, 677],
      'correctAns': 746
    },
    {
      'questionText1': 'Find the missing number in series',
      'questionText2': '85, 170, 255, 340, ?, 510',
      'answers': [344, 366, 425, 492],
      'correctAns': 425
    },
    {
      'questionText1': 'Find the missing number in series',
      'questionText2': '66, 264, ?, 4224, 16896, 67584',
      'answers': [1056, 1063, 815, 1397],
      'correctAns': 1056
    }
  ];

  @override
  void initState() {
    fetchQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(_newQues)
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
        // _newQues,
        hardCodedQuestions,
      ),
    );
  }
}

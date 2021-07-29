import 'package:domo_quiz/widgets/next_skip.dart';
import 'package:flutter/material.dart';
import '../widgets/option_item.dart';
import '../widgets/question.dart';

class QuizScreen extends StatefulWidget {
  //Values taken from provided UI sample
  List<Map<String, Object>> questions;

  QuizScreen(this.questions);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Color topBarcolor1 = const Color(0xFF236D72);

  final Color topBarcolor2 = const Color(0x4D9196).withOpacity(0.97);

  final Color orangeColor = const Color(0xFFEC8308);

  final Color greyColor = const Color(0xFFF6F5F5);

  int questionIndex = 0;

  List<bool> _isSelected = [false, false, false, false];

  // void resetSelected(int selectedAns, bool isOptionselected){
  //     _isSelected.where((element) => element.title == selectedAns)

  // }

  void raiseIndex() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                topBarcolor1,
                topBarcolor2,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          Container(
            height: 6,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 26,
                  color: orangeColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('1/10'),
          ),
          Question(widget.questions[questionIndex]['questionText1'],
              widget.questions[questionIndex]['questionText2']),
          SizedBox(height: 24),
          Column(
            children: [
              OptionItem(
                title: 0,
                correctAns: widget.questions[questionIndex]['correctAns'],
              ),
              OptionItem(
                title: -1,
                correctAns: widget.questions[questionIndex]['correctAns'],
              ),
              OptionItem(
                title: -3,
                correctAns: widget.questions[questionIndex]['correctAns'],
              ),
              OptionItem(
                title: -2,
                correctAns: widget.questions[questionIndex]['correctAns'],
              ),
            ],
          ),
          // ListView.builder(
          //   itemBuilder: (context, index) {
          //     return OptionItem(
          //       title: ((widget.questions[questionIndex]['answers'])
          //           as List)[index],
          //       correctAns: widget.questions[questionIndex]['correctAns'],
          //     );
          //   },
          //   itemCount:
          //       ((widget.questions[questionIndex]['answers']) as List).length,
          // ),

          SizedBox(
            height: 64,
          ),
          NextSkip(raiseIndex),
        ],
      ),
    );
  }
}

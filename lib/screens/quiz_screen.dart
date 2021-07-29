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
  final CircleAvatar theEmptyIcon = CircleAvatar(
    backgroundColor: Color(0xFFE5E5E5),
    radius: 15,
  );
  CircleAvatar get theIcon {
    return theEmptyIcon;
  }

  final Color topBarcolor1 = const Color(0xFF236D72);

  final Color topBarcolor2 = const Color(0x4D9196).withOpacity(0.97);

  final Color orangeColor = const Color(0xFFEC8308);

  final Color greyColor = const Color(0xFFF6F5F5);

  int questionIndex = 0;

  List<bool> _isSelected = [false, false, false, false];
  List<int> get answers {
    return widget.questions[questionIndex]['answers'] as List<int>;
  }

  void resetSelected(int ansIndex, bool ansValue) {
    _isSelected[ansIndex] = ansValue;
    print('bools are set false for indexes: ');
    for (int i = 0; i < answers.length; i++) {
      if (i != ansIndex) {
        setState(() {
          _isSelected[i] = false;
        });
      }
      print('$_isSelected[i] ,');
    }
  }

  void raiseIndex() {
    if (questionIndex == widget.questions.length - 1)
      Navigator.of(context).pop();
    else
      setState(() {
        questionIndex++;
      });
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${questionIndex + 1} / 10',
              style: TextStyle(fontSize: 10),
            ),
          ),
          Question(widget.questions[questionIndex]['questionText1'],
              widget.questions[questionIndex]['questionText2']),
          SizedBox(height: 24),
          Container(
            height: 245,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return OptionItem(
                  title: answers[index],
                  correctAns: widget.questions[questionIndex]['correctAns'],
                  isOptionSelected: _isSelected[index],
                  answerIndex: index,
                  restOptionsDeselect: resetSelected,
                );
              },
              itemCount: answers.length,
            ),
          ),
          SizedBox(
            height: 64,
          ),
          NextSkip(raiseIndex),
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

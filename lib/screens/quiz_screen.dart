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

  final CircleAvatar emptyIcon = CircleAvatar(
    backgroundColor: Color(0xFFE5E5E5),
    radius: 15,
  );
  final CircleAvatar greenTick = CircleAvatar(
    radius: 15,
    backgroundColor: Colors.green,
    child: Icon(
      Icons.check,
      color: Colors.white,
    ),
  );

  final CircleAvatar redCross = CircleAvatar(
    radius: 15,
    backgroundColor: Colors.red,
    child: Icon(
      Icons.close,
      color: Colors.white,
    ),
  );

  int questionIndex = 0;
  List<bool> _isSelected = [false, false, false, false];
  List<CircleAvatar> answerIcon = [
    CircleAvatar(
      backgroundColor: Color(0xFFE5E5E5),
      radius: 15,
    ),
    CircleAvatar(
      backgroundColor: Color(0xFFE5E5E5),
      radius: 15,
    ),
    CircleAvatar(
      backgroundColor: Color(0xFFE5E5E5),
      radius: 15,
    ),
    CircleAvatar(
      backgroundColor: Color(0xFFE5E5E5),
      radius: 15,
    ),
  ];

  List<int> get answers {
    return widget.questions[questionIndex]['answers'] as List<int>;
  }

  // void initState() {
  //   super.initState();
  //   for (int i = 0; i < answers.length; i++)
  //     answerIcon[i] = CircleAvatar(
  //       backgroundColor: Color(0xFFE5E5E5),
  //       radius: 15,
  //     );
  // }

  void resetSelected(int ansIndex) {
    //print('Bools are set false for indexes: ');
    for (int i = 0; i < answers.length; i++) {
      if (i != ansIndex) {
        setState(() {
          _isSelected[i] = false;
          answerIcon[i] = emptyIcon;
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

  bool isCorrect(int thisAns, int answer) {
    if (thisAns == answer)
      return true;
    else
      return false;
  }

  void toggleIcon(int index, int actualAns) {
    if (_isSelected[index] == false) {
      print('Empty -> Filled');
      if (!isCorrect(answers[index], actualAns)) {
        setState(() {
          _isSelected[index] = true;
          answerIcon[index] = redCross;
        });
      } else {
        setState(() {
          _isSelected[index] = true;

          answerIcon[index] = greenTick;
        });
      }
    } else {
      print('Filled -> Empty');
      setState(() {
        _isSelected[index] = false;
        answerIcon[index] = emptyIcon;
      });
    }
    resetSelected(index);
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
          //SizedBox(height: 24),
          Row(children: answerIcon),
          Container(
            height: 245,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return OptionItem(
                  title: answers[index],
                  correctAns: widget.questions[questionIndex]['correctAns'],
                  answerIndex: index,
                  isOptionSelected: _isSelected[index],
                  toggleAnswerHandler: toggleIcon,
                  icon: answerIcon[index],
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

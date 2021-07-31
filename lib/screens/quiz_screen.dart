import 'package:flutter/material.dart';
import '../widgets/question.dart';
import '../widgets/appbar_ui.dart';
import '../widgets/option_item.dart';
import '../widgets/next_skip.dart';

class QuizScreen extends StatefulWidget {
  //Values taken from provided UI sample
  final List<Map<String, Object>> questions;

  QuizScreen(this.questions);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Color greymediumColor = const Color(0xFFE5E5E5);

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
  List<int> banswers = [];
  List<dynamic> get answers {
    return widget.questions[questionIndex]['answers'] as List<dynamic>;
  }

  bool isCorrectAnswerSelected = false;
  List<Container> progressBar;
  List<Map<String, Object>> updatedQuestions;

  @override
  // void initState() {
  //   super.initState();
  //   ob.fetchQuestions().then((value) {
  //     updatedQuestions = ob.newQues;
  //   });
  // }

  @override
  void didChangeDependencies() {
    progressBar = [
      Container(
        width: 26.16,
        color: Theme.of(context).errorColor,
      ),
    ];
    super.didChangeDependencies();
  }

  void resetSelected(int ansIndex) {
    for (int i = 0; i < answers.length; i++) {
      if (i != ansIndex) {
        setState(() {
          _isSelected[i] = false;
          answerIcon[i] = emptyIcon;
        });
      }
    }
  }

  void nextskipButtonPressed() {
    if (questionIndex == widget.questions.length - 1)
      Navigator.of(context).pop();
    else
      setState(() {
        questionIndex++;
        for (int i = 0; i < answers.length; i++) {
          _isSelected[i] = false;
          answerIcon[i] = emptyIcon;
        }

        if (isCorrectAnswerSelected == true) {
          progressBar.removeLast();
          progressBar.add(
            Container(width: 26.16, color: Theme.of(context).primaryColor),
          );
          progressBar.add(
            Container(width: 26.16, color: Theme.of(context).errorColor),
          );
          isCorrectAnswerSelected = false;
        } else {
          progressBar.add(
            Container(width: 26.16, color: Theme.of(context).errorColor),
          );
        }
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
          isCorrectAnswerSelected = false;

          //nextskipText = skipText;
        });
      } else {
        setState(() {
          _isSelected[index] = true;
          answerIcon[index] = greenTick;
          isCorrectAnswerSelected = true;

          //nextskipText = nextText;
        });
      }
    } else {
      print('Filled -> Empty');
      setState(() {
        _isSelected[index] = false;
        answerIcon[index] = emptyIcon;
        isCorrectAnswerSelected = false;

        //nextskipText = skipText;
      });
    }
    resetSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarUI(),
          Container(
            height: 6,
            width: double.infinity,
            color: greymediumColor,
            child: Row(
              children: progressBar,
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
          NextSkip(isCorrectAnswerSelected, nextskipButtonPressed),
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

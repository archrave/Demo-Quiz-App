import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final int title;
  final int correctAns;
  final int answerIndex;
  bool isOptionSelected;
  final Function toggleAnswerHandler;

  //final Function restOptionsDeselect;
  CircleAvatar icon;
  //bool isOptionSelected;
  OptionItem({
    @required this.title,
    @required this.correctAns,
    @required this.answerIndex,
    @required this.isOptionSelected,
    @required this.toggleAnswerHandler,
    //@required this.restOptionsDeselect,
    @required icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(30),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 2,
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(30)),
              width: 330,
              height: 40,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: icon,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text('$title'),
                ],
              )),
        ),
        onTap: () => toggleAnswerHandler(answerIndex, correctAns),
      ),
    );
  }
}

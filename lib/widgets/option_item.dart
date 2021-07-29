import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final int title;
  final int correctAns;
  final int answerIndex;
  final bool isOptionSelected;
  final Function toggleAnswerHandler;
  final CircleAvatar icon;

  //final Function restOptionsDeselect;
  //bool isOptionSelected;
  OptionItem({
    @required this.title,
    @required this.correctAns,
    @required this.answerIndex,
    @required this.isOptionSelected,
    @required this.toggleAnswerHandler,
    @required this.icon,
  });

  Color buildBorderColor(CircleAvatar anIcon, BuildContext ctx) {
    if (anIcon.toString() ==
        CircleAvatar(
          backgroundColor: Color(0xFFE5E5E5),
          radius: 15,
        ).toString()) return Theme.of(ctx).accentColor;
    if (anIcon.toString() ==
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ).toString()) return Theme.of(ctx).primaryColor;

    if (anIcon.toString() ==
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ).toString())
      return Colors.red;
    else
      return Theme.of(ctx).primaryColor;
  }

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
                  // border:
                  // Border.all(
                  //   color: buildBorderColor(icon, context),
                  // ),
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(30)),
              width: 330,
              height: 41,
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

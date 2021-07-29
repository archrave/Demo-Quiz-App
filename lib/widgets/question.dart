import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String quesText1;
  final String quesText2;
  Question(this.quesText1, this.quesText2);

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.all(15),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(25)),
        width: 330,
        height: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quesText1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              quesText2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

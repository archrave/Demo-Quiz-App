import 'package:flutter/material.dart';

class NextSkip extends StatefulWidget {
  @override
  _NextSkipState createState() => _NextSkipState();
}

class _NextSkipState extends State<NextSkip> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Too Hard! Take the next question',
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 6),
      InkWell(
        splashColor: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(30),
        child: Card(
          margin: EdgeInsets.all(5),
          color: Theme.of(context).accentColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 4,
          child: Container(
            width: 280,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        onTap: () {},
      ),
    ]);
  }
}

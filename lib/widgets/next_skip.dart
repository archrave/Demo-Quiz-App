import 'package:flutter/material.dart';

class NextSkip extends StatefulWidget {
  final Function raiseindexHandler;
  //final Text text;
  final bool isCorrectSel;
  NextSkip(this.isCorrectSel, this.raiseindexHandler);

  @override
  _NextSkipState createState() => _NextSkipState();
}

class _NextSkipState extends State<NextSkip> {
  Text skipText;
  //Text nextskipText;
  Text nextText;
  @override
  void didChangeDependencies() {
    skipText = Text('Skip',
        style: TextStyle(fontSize: 16, color: Theme.of(context).errorColor));

    //nextskipText = skipText;

    // Text nextskipText = Text('Skip', style: TextStyle(color: Color(0xFFEC8308)));
    nextText =
        Text('Next', style: TextStyle(fontSize: 16, color: Colors.white));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.isCorrectSel
        ? Column(children: [
            Text(
              'Too Hard! Take the next question',
              style:
                  TextStyle(fontSize: 10, color: Theme.of(context).errorColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            InkWell(
              splashColor: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(30),
              child: Card(
                margin: EdgeInsets.all(5),
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Theme.of(context)
                            .errorColor, //                   <--- border color
                      )),
                  width: 280,
                  height: 50,
                  alignment: Alignment.center,
                  child: skipText,
                ),
              ),
              onTap: () {
                widget.raiseindexHandler();
              },
            ),
          ])
        : Column(children: [
            Text(
              'Awesome ! Try another question',
              style: TextStyle(
                  fontSize: 10, color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            InkWell(
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
              child: Card(
                margin: EdgeInsets.all(5),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 2,
                child: Container(
                  width: 280,
                  height: 50,
                  alignment: Alignment.center,
                  child: nextText,
                ),
              ),
              onTap: () {
                widget.raiseindexHandler();
              },
            ),
          ]);
  }
}

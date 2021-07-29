import 'package:flutter/material.dart';

class OptionItem extends StatefulWidget {
  final int title;
  final int correctAns;
  final int answerIndex;
  final Function restOptionsDeselect;

  bool isOptionSelected;
  OptionItem({
    @required this.title,
    @required this.correctAns,
    @required this.isOptionSelected,
    @required this.answerIndex,
    @required this.restOptionsDeselect,
  });

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  void initState() {
    icon = emptyIcon;

    super.initState();
  }

  // _OptionItemState() {
  // }
  CircleAvatar icon;

  @override
  void didChangeDependencies() {
    if (widget.isOptionSelected == false)
      setState(() {
        icon = emptyIcon;
      });

    super.didChangeDependencies();
  }

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

  bool isCorrect(int thisAns, int answer) {
    if (thisAns == answer)
      return true;
    else
      return false;
  }

//Used to string because equalto operator wasn't working
  void toggleIcon() {
    if (widget.isOptionSelected == false) {
      print('matkr');
      if (!isCorrect(widget.title, widget.correctAns)) {
        setState(() {
          icon = redCross;
        });
      } else {
        setState(() {
          icon = greenTick;
        });
      }
      widget.isOptionSelected = true;
    } else {
      print('setkAr');
      setState(() {
        icon = emptyIcon;
      });
      widget.isOptionSelected = false;
    }
    widget.restOptionsDeselect(widget.answerIndex, widget.isOptionSelected);
  }

  void deSelect() {
    if (widget.isOptionSelected == false)
      setState(() {
        icon = emptyIcon;
      });
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
                  Text('${widget.title}'),
                ],
              )),
        ),
        onTap: toggleIcon,
      ),
    );
  }
}

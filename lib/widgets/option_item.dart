import 'package:flutter/material.dart';

class OptionItem extends StatefulWidget {
  final int title;
  final int correctAns;
  OptionItem({@required this.title, @required this.correctAns});

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  _OptionItemState() {
    icon = emptyIcon;
  }

  CircleAvatar icon;

  final CircleAvatar emptyIcon = CircleAvatar(
    backgroundColor: Color(0xFFE5E5E5),
    radius: 15,
    //child: Icon(Icons.circle_outlined, size: 33, color: Colors.grey)
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
    if (icon == emptyIcon) {
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
    } else {
      print('setkAr');
      setState(() {
        icon = emptyIcon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(30),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 4,
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(30)),
            width: 360,
            height: 45,
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
    );
  }
}

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

  bool isSelected = false;

//Used to string because equalto operator wasn't working
  void toggleIcon() {
    if (isSelected == false) {
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
      isSelected = true;
    } else {
      print('setkAr');
      setState(() {
        icon = emptyIcon;
      });
      isSelected = false;
    }
  }

  void deSelect() {
    setState(() {
      icon = emptyIcon;
    });
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(30),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2,
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(30)),
            width: 330,
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

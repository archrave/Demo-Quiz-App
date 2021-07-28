import 'package:flutter/material.dart';

class OptionItem extends StatefulWidget {
  final int title;
  final int correctAns;
  OptionItem({@required this.title, @required this.correctAns});

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  final Icon emptyIcon = Icon(Icons.circle_outlined, color: Colors.grey);
  Icon icon = Icon(Icons.circle_outlined, color: Colors.grey);

  bool isCorrect(int thisAns, int answer) {
    if (thisAns == answer)
      return true;
    else
      return false;
  }

//Used to string because equalto operator wasn't working
  void toggleIcon() {
    if (icon.toString() == emptyIcon.toString()) {
      if (!isCorrect(widget.title, widget.correctAns)) {
        setState(() {
          icon = Icon(Icons.minimize_outlined);
        });
      } else {
        setState(() {
          icon = Icon(Icons.add);
        });
      }
    } else {
      setState(() {
        icon = Icon(Icons.circle_outlined, color: Colors.grey);
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
                  child: icon,
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

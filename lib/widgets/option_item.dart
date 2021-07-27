import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final String title;
  final bool isCorrect;

  OptionItem({@required this.title, this.isCorrect = false});
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
                  child: Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text('0'),
              ],
            )),
      ),
      onTap: () {},
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/option_item.dart';

class HomeScreen extends StatelessWidget {
  //Values taken from provided UI sample
  final Color topBarcolor1 = const Color(0xFF236D72);
  final Color topBarcolor2 = const Color(0x4D9196).withOpacity(0.97);
  final Color orangeColor = const Color(0xFFEC8308);
  final Color greyColor = const Color(0xFFF6F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            child: Center(
              child: Image.asset(
                'images/domo_logo.png',
                width: 100,
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                topBarcolor1,
                topBarcolor2,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          Container(
            height: 6,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 26,
                  color: orangeColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('1/10'),
          ),
          Card(
            //margin: EdgeInsets.all(15),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              color: greyColor,
              width: 380,
              height: 72,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Find the missing numbers in series',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '8, ?, -4, -10, -16, -22',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Column(
            children: [
              OptionItem(
                title: '0',
              ),
              OptionItem(
                title: '0',
              ),
              OptionItem(
                title: '0',
              ),
              OptionItem(
                title: '0',
              ),
            ],
          ),
          SizedBox(
            height: 64,
          ),
          Text(
            'Too Hard! Take the next question',
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
          Container(
            child: RaisedButton(
              onPressed: () {},
            ),
            width: 240,
            height: 45,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          ),
        ],
      ),
    );
  }
}

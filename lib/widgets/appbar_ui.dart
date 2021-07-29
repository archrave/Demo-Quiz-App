import 'package:flutter/material.dart';

class AppbarUI extends StatelessWidget {
  final Color topBarcolor1 = const Color(0xFF236D72);
  final Color topBarcolor2 = const Color(0x4D9196).withOpacity(0.97);
  final Color orangeColor = const Color(0xFFEC8308);
  final Color greyColor = const Color(0xFFF6F5F5);
  final Color greymediumColor = const Color(0xFFE5E5E5);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

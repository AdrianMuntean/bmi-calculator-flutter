import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final String title;
  final Function onTap;

  CalculateButton({this.title = 'CALCULATE', @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        height: 80,
        child: Center(
          child: Text(
            this.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}

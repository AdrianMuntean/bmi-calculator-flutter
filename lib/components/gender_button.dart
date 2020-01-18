import 'package:flutter/material.dart';

import '../constants.dart';

class GenderButton extends StatelessWidget {
  final String text;
  final IconData icon;

  GenderButton({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          this.text,
          style: DESCRIPTION_TEXT_STYLE,
        )
      ],
    );
  }
}

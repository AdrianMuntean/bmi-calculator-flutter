import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final Function onLongPress;
  final IconData iconData;

  RoundIconButton({@required this.onPressed, this.onLongPress, this.iconData});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(this.iconData),
      elevation: 5,
      constraints: BoxConstraints.tightFor(width: 45, height: 45),
    );
  }
}

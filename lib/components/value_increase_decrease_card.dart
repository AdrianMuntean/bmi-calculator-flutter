import 'package:flutter/material.dart';

import '../constants.dart';
import 'round_icon_button.dart';

class ValueIncreaseDecreaseCard extends StatelessWidget {
  final String label;
  final int value;
  final String unit;
  final Function onPressIncrease;
  final Function onLongPressIncrease;
  final Function onPressDecrease;
  final Function onLongPressDecrease;

  ValueIncreaseDecreaseCard(
      {@required this.value,
      @required this.label,
      this.unit = '',
      this.onPressIncrease,
      this.onLongPressIncrease,
      this.onPressDecrease,
      this.onLongPressDecrease});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: DESCRIPTION_TEXT_STYLE,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              value.toString(),
              style: BIG_NUMBER_TEXT_STYLE,
            ),
            Text(
              unit,
              style: DESCRIPTION_TEXT_STYLE,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              onPressed:
                  this.onPressDecrease != null ? this.onPressDecrease : null,
              onLongPress: this.onLongPressDecrease != null
                  ? this.onLongPressDecrease
                  : null,
              iconData: Icons.remove,
            ),
            SizedBox(
              width: 20,
            ),
            RoundIconButton(
              iconData: Icons.add,
              onPressed:
                  this.onPressIncrease != null ? this.onPressIncrease : null,
              onLongPress: this.onLongPressIncrease != null
                  ? this.onLongPressIncrease
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}

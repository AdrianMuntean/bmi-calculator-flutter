import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  MainContainer({@required this.color, this.child, this.onTap});
  final Color color;
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap != null ? this.onTap : null,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: this.child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({Key? key, this.width = 250.0, this.height = 250.0, required this.child, this.borderColor = const Color.fromRGBO(0, 200, 0, 1)}) : super(key: key);
  final Color borderColor;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color:  borderColor,
            width: 3.0
          )
        ),
      ),
      child: child,
    );
  }
}

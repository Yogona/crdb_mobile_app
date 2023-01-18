import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  const Pill({Key? key, required this.text, this.normalTextColor = Colors.black, this.inflatedTextColor = Colors.white, this.topLeftColor = const Color.fromRGBO(0, 200, 0, 1), this.bottomRightColor = const Color.fromRGBO(0, 180, 0, 1), this.isInflated = false}) : super(key: key);
  final String text;
  final Color topLeftColor;
  final Color bottomRightColor;
  final bool isInflated;
  final Color inflatedTextColor;
  final Color normalTextColor;

  @override
  Widget build(BuildContext context) {
    return (isInflated)?Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: topLeftColor,
            spreadRadius: 1.0,
            blurRadius: 5.0
          )
        ],
        gradient: LinearGradient(
          colors: [
            topLeftColor, bottomRightColor
          ]
        )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: inflatedTextColor
          ),
        ),
      ),
    ):
    Text(
      text,
      style: TextStyle(
        color: normalTextColor
      ),
    );
  }
}

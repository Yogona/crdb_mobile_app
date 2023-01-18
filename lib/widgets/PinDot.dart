import 'package:flutter/material.dart';

class PinDot extends StatelessWidget {
  const PinDot({Key? key, this.isLit = true, this.size = 20.0}) : super(key: key);
  final bool isLit;
  final double size;

  @override
  Widget build(BuildContext context) {
    return (isLit)?Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.green,
            blurRadius: 10.0,
            spreadRadius: 1.0
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.3],
          colors: [
            Color.fromRGBO(50, 255, 50, 1.0),
            Colors.green
          ]
        )
      ),
    ):
    Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }
}

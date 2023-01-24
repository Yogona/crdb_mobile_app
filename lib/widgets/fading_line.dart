import 'package:flutter/material.dart';

class FadingLine extends StatelessWidget {
  const FadingLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 0.5, 1.0],
            colors: [
              Color.fromRGBO(0, 200, 0, .0),
              Color.fromRGBO(0, 255, 0, 1),
              Color.fromRGBO(0, 200, 0, .0),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 180, 0, 1),
              spreadRadius: 1.0,
              blurRadius: 5.0,
            )
          ]
      ),
    );
  }
}

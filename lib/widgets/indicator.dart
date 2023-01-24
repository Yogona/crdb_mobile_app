import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 3.0,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 220, 0, 1),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 5.0
            )
          ]
      ),
    );
  }
}

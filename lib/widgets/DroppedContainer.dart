import 'package:flutter/material.dart';

class DroppedContainer extends StatelessWidget {
  const DroppedContainer({Key? key, this.vMargin = 10.0, required this.pills}) : super(key: key);
  final List<Widget> pills;
  final double vMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(150, 150, 150, 1.0),
            ),
            BoxShadow(
              color: Color.fromRGBO(200, 200, 200, 1.0),
              spreadRadius: -2.0,
              blurRadius: 2.0,
            ),
          ]
      ),
      margin: EdgeInsets.symmetric(
          horizontal: 20.0, vertical: vMargin,
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: pills.map((pill) {
          return Expanded(child: Center(child: pill,),);
        }).toList(),
      ),
    );
  }
}

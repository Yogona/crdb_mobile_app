import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, this.padding = 10.0, required this.child}) : super(key: key);
  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color.fromRGBO(230, 230, 230, 1.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1.0,
                blurRadius: 5.0,
                offset: Offset(0.0, 2.0)
            )
          ]
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class InflatedIconButton extends StatelessWidget {
  const InflatedIconButton({Key? key, required this.child, required this.onPressed, this.size = 50.0}) : super(key: key);
  final Widget child;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed.call();
      },
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.0, 0.5
              ],
              colors: [
                Color.fromRGBO(255, 255, 255, 1.0),
                Color.fromRGBO(200, 200, 200, 1.0),
              ]
          ),
          boxShadow: [

            BoxShadow(
                color: Color.fromRGBO(230, 230, 230, 1.0),
                blurRadius: 0.0,
                spreadRadius: 1.0
            ),
            BoxShadow(
                color: Color.fromRGBO(200, 200, 200, 1.0)
            )
          ],
        ),
        padding: EdgeInsets.all(5.0),
        child: child,
      ),
    );
  }
}

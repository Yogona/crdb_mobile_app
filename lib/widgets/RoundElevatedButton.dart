import 'package:flutter/material.dart';

class RoundElevatedButton extends StatelessWidget {
  const RoundElevatedButton({Key? key, required this.child, required this.onPressed, this.size = 50.0}) : super(key: key);
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
          gradient: RadialGradient(
            stops: [0.0, 1.0],
            colors: [
              Color.fromRGBO(200, 200, 200, 1.0),
              Color.fromRGBO(230, 230, 230, 1.0),
            ]
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(230, 230, 230, 1.0),
                blurRadius: 0.0,
                spreadRadius: 1.0
            ),
            BoxShadow(
                color: Color.fromRGBO(200, 200, 200, 1.0),
            ),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 5.0)
            )
          ],
        ),
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

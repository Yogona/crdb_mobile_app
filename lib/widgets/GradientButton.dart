import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({Key? key, this.fontColor = Colors.white, required this.text, required this.onPressed}) : super(key: key);
  final Function onPressed;
  final String text;
  final Color fontColor;
  //final

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              stops: [0.0, 0.4],
              colors: [
                Color.fromRGBO(0, 200, 0, 1),
                Color.fromRGBO(0, 180, 0, 1),
              ]
          ),
        ),
        child: TextButton(
          onPressed: (){
            onPressed.call();
          },
          child: Text(
            text,
            style: TextStyle(
              color: fontColor,
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 1.0
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}

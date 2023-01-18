import 'package:flutter/material.dart';

class GlowingIcon extends StatelessWidget {
  const GlowingIcon({Key? key, this.size = 20.0, required this.icon, this.iconColor = const Color.fromRGBO(50, 255, 50, 1.0), this.blurColor = const Color.fromRGBO(50, 255, 50, 1.0), this.shadowColor = Colors.green}) : super(key: key);
  final Color iconColor;
  final Color blurColor;
  final Color shadowColor;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: iconColor,
      shadows: [
        Shadow(
            color: blurColor,
            blurRadius: 5.0
        ),
        // Shadow(
        //   color: shadowColor,
        // )
      ],
    );
  }
}

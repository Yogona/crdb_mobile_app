import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, this.offset = const Offset(0.0, 2.0), this.blurRadius = 5.0, this.spreadRadius = 1.0, this.onTap, this.selected = false, this.width, this.height, this.padding = 10.0, required this.child}) : super(key: key);
  final Widget child;
  final double padding;
  final double? width;
  final double? height;
  final bool selected;
  final Function? onTap;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap?.call();
      },
      child: Container(
        width: width, height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            border: (selected)?const Border.fromBorderSide(
                BorderSide(
                    color: Colors.green
                )
            ):null,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: const Color.fromRGBO(230, 230, 230, 1.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: spreadRadius,
                  blurRadius: blurRadius,
                  offset: offset,
              ),
            ]
        ),
        child: child,
      ),
    );
  }
}

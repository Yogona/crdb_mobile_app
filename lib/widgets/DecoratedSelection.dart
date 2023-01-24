import 'package:flutter/material.dart';

class DecoratedSelection extends StatelessWidget{
  const DecoratedSelection({Key? key, this.decoration, required this.items}):super(key: key);
  final List<DropdownMenuItem<String>> items;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropdownButtonFormField(
            decoration: decoration,
            items: items,
            onChanged: (val){

            }
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(4.0),
              )
          ),
          width: 5.0,
          height: 48.0,
        ),
      ],
    );
  }
}

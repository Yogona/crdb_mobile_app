import 'package:flutter/material.dart';

import '../../shared/constraints.dart';
import '../../widgets/DecoratedSelection.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';

class CardApplicationStatus extends StatefulWidget {
  const CardApplicationStatus({Key? key}) : super(key: key);

  @override
  State<CardApplicationStatus> createState() => _CardApplicationStatusState();
}

class _CardApplicationStatusState extends State<CardApplicationStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Cards application status"
        ),
        actions: [
          InflatedIconButton(
            onPressed: (){

            },
            child: const Icon(
              Icons.chat_bubble_outline_rounded,
              size: 20.0,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Status for previously requested cards",
                style: TextStyle(
                    fontSize: 18
                ),
              ),
              SizedBox(height: vGap,),
              Text(
                  "Request for"
              ),
              SizedBox(height: 10.0,),
              DecoratedSelection(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Select account"
                ),
                items: [
                  DropdownMenuItem(
                    value: "0123456789012",
                    child: Text(
                        "0123456789012"
                    ),
                  ),
                ],
              )
            ],
          ),

          Row(
            children: [
              Expanded(
                child: GradientButton(
                  onPressed: (){

                  },
                  text: "PROCEED",
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}

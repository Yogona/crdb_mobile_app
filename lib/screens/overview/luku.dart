import 'package:flutter/material.dart';
import '../../shared/constraints.dart';
import '../../widgets/DecoratedSelection.dart';
import '../../widgets/GlowingIcon.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';

class Luku extends StatefulWidget {
  const Luku({Key? key}) : super(key: key);

  @override
  State<Luku> createState() => _LukuState();
}

class _LukuState extends State<Luku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "LUKU"
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: GlowingIcon(
                        icon: Icons.info_outline,
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Text(
                          "Please enter your meter number and amount you want to purchase then click proceed"
                      ),
                    )
                  ],
                ),

                const SizedBox(height: vGap,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Meter number"
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormField()
                  ],
                ),

                const SizedBox(height: vGap,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Amount"
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: const InputDecoration(
                          suffixIcon: Padding(padding: EdgeInsets.only(top: 10.0),child: Text("TZS", style: TextStyle(fontSize: 22),),)
                      ),
                    )
                  ],
                ),

                const SizedBox(height: vGap,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                        "Source account"
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
              ],
            ),

            const SizedBox(height: vGap,),
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
      ),
    );
  }
}

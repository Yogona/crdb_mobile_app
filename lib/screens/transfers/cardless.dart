import 'package:flutter/material.dart';
import '../../shared/constraints.dart';
import '../../widgets/DecoratedSelection.dart';
import '../../widgets/GlowingIcon.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';
import '../../widgets/fading_line.dart';

class Cardless extends StatefulWidget {
  const Cardless({Key? key}) : super(key: key);

  @override
  State<Cardless> createState() => _CardlessState();
}

class _CardlessState extends State<Cardless> {
  bool addDescription = false;
  String description = "+ Add description";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Cardless"
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
                      "Send money to CRDB and Non-CRDB customers and they can withdraw at any CRDB ATM without a card."
                  ),
                )
              ],
            ),

            const SizedBox(height: vGap,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                    "Send from"
                ),
                SizedBox(height: 10.0,),
                DecoratedSelection(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Select source account"
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

            const SizedBox(height: vGap,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Mobile number"
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Required", suffixIcon: Icon(Icons.contact_phone_rounded)
                  ),
                )
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
                  decoration: const InputDecoration(),
                )
              ],
            ),

            const SizedBox(height: vGap,),
            const FadingLine(),

            const SizedBox(height: vGap,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Transfer description (otional)"
                ),
                const SizedBox(height: 10.0,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(addDescription){
                        description = "- Remove description";
                      }else{
                        description = "+ Add description";
                      }
                      addDescription = !addDescription;
                    });
                  },
                  child: Text(description),
                ),
                const SizedBox(height: 10.0,),
                (addDescription)?TextFormField():const SizedBox(),
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

import 'package:flutter/material.dart';

import '../../shared/constraints.dart';
import '../../widgets/DecoratedSelection.dart';
import '../../widgets/GlowingIcon.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';
import '../../widgets/fading_line.dart';

class OtherBanks extends StatefulWidget {
  const OtherBanks({Key? key}) : super(key: key);

  @override
  State<OtherBanks> createState() => _OtherBanksState();
}

class _OtherBanksState extends State<OtherBanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.0,
        title: const Text(
            "Transfer to other banks"
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            const SizedBox(height: vGap,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                    "Beneficiary bank name"
                ),
                SizedBox(height: 10.0,),
                DecoratedSelection(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Select bank name"
                  ),
                  items: [
                    DropdownMenuItem(
                      value: "ABSA",
                      child: Text(
                          "ABSA"
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
                    "Beneficiary amount"
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Required"
                  ),
                )
              ],
            ),

            const SizedBox(height: vGap,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Beneficiary full name"
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Required"
                  ),
                )
              ],
            ),

            const SizedBox(height: vGap,),
            Row(
              children: const [
                Expanded(
                  child: GlowingIcon(
                    icon: Icons.info_outline,
                    iconColor: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Text(
                      "Enter full name as on beneficiary account.",
                    style: TextStyle(
                      color: Colors.red
                    ),
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
                TextFormField()
              ],
            ),

            const SizedBox(height: vGap,),
            const FadingLine(),

            const SizedBox(height: vGap,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Transfer description"
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Required"
                  ),
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

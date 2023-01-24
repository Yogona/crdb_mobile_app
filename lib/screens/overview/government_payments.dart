import 'package:flutter/material.dart';

import '../../shared/constraints.dart';
import '../../widgets/GlowingIcon.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';

class GovernmentPayments extends StatefulWidget {
  const GovernmentPayments({Key? key}) : super(key: key);

  @override
  State<GovernmentPayments> createState() => _GovernmentPaymentsState();
}

class _GovernmentPaymentsState extends State<GovernmentPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Government Payments"
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      flex: 10,
                      child: Text(
                          "Make your payment to all government institutions using control number e.g. TRA, Traffic fines, Water bills, Immigration etc"
                      ),
                    )
                  ],
                ),
                const SizedBox(height: vGap,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter control number or scan QR code"
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "0123456789",
                        suffixIcon: Icon(
                          Icons.qr_code_scanner_outlined
                        ),
                      ),
                    )
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
                    text: "GET DETAILS",
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

import 'package:crdb_mobile_app/widgets/DecoratedSelection.dart';
import 'package:crdb_mobile_app/widgets/DroppedContainer.dart';
import 'package:flutter/material.dart';

import '../../shared/constraints.dart';
import '../../widgets/GlowingIcon.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';
import '../../widgets/Pill.dart';
import '../../widgets/fading_line.dart';

class AirtimeBundles extends StatefulWidget {
  const AirtimeBundles({Key? key}) : super(key: key);

  @override
  State<AirtimeBundles> createState() => _AirtimeBundlesState();
}

class _AirtimeBundlesState extends State<AirtimeBundles> {
  List<bool> pillEnabled = [true, false];

  void inflatePill(int index){
    setState(() {
      //Set all pills to not inflated
      pillEnabled.setAll(0, [false, false]);
      //Now specified pill is inflated
      pillEnabled[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Airtime and bundles"
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DroppedContainer(
              pills: [
                Pill(
                  onTap: (){
                    inflatePill(0);
                  },
                  isInflated: pillEnabled[0],
                  text: "Airtime",
                ),
                Pill(
                  onTap: (){
                    inflatePill(1);
                  },
                  isInflated: pillEnabled[1],
                  text: "Bundles",
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Builder(
                  builder: (context){
                    if(pillEnabled[0]){
                      return const Airtime();
                    }

                    return const Bundles();
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Bundles extends StatefulWidget {
  const Bundles({Key? key}) : super(key: key);

  @override
  State<Bundles> createState() => _BundlesState();
}

class _BundlesState extends State<Bundles> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  "Buy bundles for different network service providers"
              ),
            )
          ],
        ),

        const SizedBox(height: vGap,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
                "From"
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
                "Service type"
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
                  value: "SMILE",
                  child: Text(
                      "SMILE"
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
                "Account number"
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "0712345678"
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
              decoration: const InputDecoration(
                  suffixIcon: Padding(padding: EdgeInsets.only(top: 10.0),child: Text("TZS", style: TextStyle(fontSize: 22),),)
              ),
            )
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
    );
  }
}


class Airtime extends StatefulWidget {
  const Airtime({Key? key}) : super(key: key);

  @override
  State<Airtime> createState() => _AirtimeState();
}

class _AirtimeState extends State<Airtime> {
  bool addDescription = false;
  String description = "+ Add description";
  @override
  Widget build(BuildContext context) {
    return Column(
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
                "Buy airtime for all networks (Tigo, Vodacom, Airtel, Zantel, Halotel, TTCL)"
              ),
            )
          ],
        ),

        const SizedBox(height: vGap,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "From"
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
          children: [
            const Text(
              "Mobile number (all networks)"
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "0712345678", suffixIcon: Icon(Icons.contact_phone_rounded)
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
              decoration: const InputDecoration(
                  suffixIcon: Padding(padding: EdgeInsets.only(top: 10.0),child: Text("TZS", style: TextStyle(fontSize: 22),),)
              ),
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
    );
  }
}

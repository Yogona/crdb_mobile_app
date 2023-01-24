import 'package:flutter/material.dart';

import '../../shared/constraints.dart';
import '../../widgets/DecoratedSelection.dart';
import '../../widgets/DroppedContainer.dart';
import '../../widgets/GlowingIcon.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';
import '../../widgets/Pill.dart';
import '../../widgets/fading_line.dart';

class CrdbAccounts extends StatefulWidget {
  const CrdbAccounts({Key? key}) : super(key: key);

  @override
  State<CrdbAccounts> createState() => _CrdbAccountsState();
}

enum Display{
  other, own, sim
}

class _CrdbAccountsState extends State<CrdbAccounts> {
  List<bool> pillEnabled = [true, false, false];
  Display display = Display.other;

  void inflatePill(int index){
    setState(() {
      //Set all pills to not inflated
      pillEnabled.setAll(0, [false, false, false]);
      //Now specified pill is inflated
      pillEnabled[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Transfer to CRDB account(s)",
          style: TextStyle(
            fontSize: 19
          ),
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
        children: [
          DroppedContainer(
            pills: [
              Pill(
                onTap: (){
                  display = Display.other;
                  inflatePill(0);
                },
                text: 'Other account',
                fontSize: (pillEnabled[0])?13:14,
                isInflated: pillEnabled[0],
              ),
              Pill(
                onTap: (){
                  display = Display.own;
                  inflatePill(1);
                },
                text: 'Own accounts',
                isInflated: pillEnabled[1],
              ),
              Pill(
                onTap: (){
                  display = Display.sim;
                  inflatePill(2);
                },
                text: 'SimAccount',
                isInflated: pillEnabled[2],
              ),
            ],
          ),

          SizedBox(
            height: height*.72,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Builder(
                  builder: (context){
                    if(Display.own == display){
                      return const Own();
                    }
                    else if(Display.sim == display){
                      return const Sim();
                    }

                    return const Other();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Sim extends StatefulWidget {
  const Sim({Key? key}) : super(key: key);

  @override
  State<Sim> createState() => _SimState();
}

class _SimState extends State<Sim> {
  bool addDescription = false;
  String description = "+ Add description";

  @override
  Widget build(BuildContext context) {
    return Column(
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
          children: [
            const Text(
                "To SimAccount number"
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
                text: "GET DETAILS",
              ),
            )
          ],
        )
      ],
    );
  }
}


class Own extends StatefulWidget {
  const Own({Key? key}) : super(key: key);

  @override
  State<Own> createState() => _OwnState();
}

class _OwnState extends State<Own> {
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
                  "You can now transfer funds through USD, GBP, and Euro currencies."
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
                "To account"
            ),
            SizedBox(height: 10.0,),
            DecoratedSelection(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Select beneficiary account"
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
                "Transfer amount"
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


class Other extends StatefulWidget {
  const Other({Key? key}) : super(key: key);

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
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
                  "You can now transfer funds through USD, GBP, and Euro currencies."
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
                "Enter CRDB bank account"
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Required",
              ),
            )
          ],
        ),

        const SizedBox(height: vGap,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Transfer amount"
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

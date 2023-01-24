import 'package:flutter/material.dart';

import '../shared/constraints.dart';
import '../widgets/DecoratedSelection.dart';
import '../widgets/DroppedContainer.dart';
import '../widgets/GlowingIcon.dart';
import '../widgets/GradientButton.dart';
import '../widgets/InflatedIconButton.dart';
import '../widgets/Pill.dart';
import '../widgets/fading_line.dart';

class Cashout extends StatefulWidget {
  const Cashout({Key? key}) : super(key: key);

  @override
  State<Cashout> createState() => _CashoutState();
}

class _CashoutState extends State<Cashout> {
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
        elevation: 0.0,
        toolbarHeight: 70.0,
        leading: Container(
          margin: const EdgeInsets.only(
              left: 10.0
          ),
          child: CircleAvatar(
            radius: 100.0,
            backgroundImage: Image.network(
                "https://th.bing.com/th/id/R.0771e184dbb04e47c667d38c6e6bb6df?rik=sprfZaNYE%2bvU1A&riu=http%3a%2f%2fgymkhana.iitb.ac.in%2f%7esports%2fimages%2fprofile.png&ehk=QeYO2n9hr6iOCpGjMhFFocMp3a84UVyrE1IADVb3oHA%3d&risl=&pid=ImgRaw&r=0"
            ).image,
          ),
        ),
        title: const Text(
            "Habari za Usiku Yona"
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
                  text: "Wakala/Branch",
                ),
                Pill(
                  onTap: (){
                    inflatePill(1);
                  },
                  isInflated: pillEnabled[1],
                  text: "ATM",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Builder(
                  builder: (context){
                    if(pillEnabled[0]){
                      return const Branch();
                    }

                    return const ATM();
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ATM extends StatefulWidget {
  const ATM({Key? key}) : super(key: key);

  @override
  State<ATM> createState() => _ATMState();
}

class _ATMState extends State<ATM> {
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
                  "Withdraw cash at your nearest CRDB ATM without your TemboCard"
              ),
            )
          ],
        ),

        const SizedBox(height: vGap,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
                "Withdraw from"
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
    );
  }
}


class Branch extends StatefulWidget {
  const Branch({Key? key}) : super(key: key);

  @override
  State<Branch> createState() => _BranchState();
}

class _BranchState extends State<Branch> {
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
                  "Visit your nearest CRDB Wakala or Branch Teller to withdraw cash conveniently without an ATM card."
              ),
            )
          ],
        ),

        const SizedBox(height: vGap,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
                "Withdraw from"
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
                "Enter amount"
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
    );
  }
}

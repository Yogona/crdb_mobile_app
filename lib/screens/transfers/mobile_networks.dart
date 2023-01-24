import 'package:flutter/material.dart';

import '../../shared/constraints.dart';
import '../../widgets/DecoratedSelection.dart';
import '../../widgets/DroppedContainer.dart';
import '../../widgets/GlowingIcon.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';
import '../../widgets/Pill.dart';
import '../../widgets/fading_line.dart';

class MobileNetworks extends StatefulWidget {
  const MobileNetworks({Key? key}) : super(key: key);

  @override
  State<MobileNetworks> createState() => _MobileNetworksState();
}

class _MobileNetworksState extends State<MobileNetworks> {
  bool addDescription = false;
  String description = "+ Add description";
  List<bool> pillEnabled = [true, false];

  void inflatePill(int index){
    setState(() {
      //Set all pills to not inflated
      pillEnabled.setAll(0, [false, false]);
      //Now specified pill is inflated
      pillEnabled[index] = true;

      if(index == 1){
        mobNoController.text = "";
      }else{
        mobNoController.text = "0712500282";
      }
    });
  }

  TextEditingController mobNoController = TextEditingController(text: "0712500282");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Transfer to mobile"
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
                  text: "My number",
                ),
                Pill(
                  onTap: (){
                    inflatePill(1);
                  },
                  isInflated: pillEnabled[1],
                  text: "Other number",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                            "Send money to all networks (Mpesa, Tigopesa, Airtelmoney, Ezypesa, Halopesa, Tpesa)"
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
                          "Mobile number (all networks)"
                      ),
                      const SizedBox(height: 10.0,),
                      TextFormField(
                        controller: mobNoController,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

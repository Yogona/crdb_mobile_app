import 'package:crdb_mobile_app/widgets/RoundElevatedButton.dart';
import 'package:flutter/material.dart';

import '../widgets/CircleContainer.dart';
import '../widgets/CustomCard.dart';
import '../widgets/DroppedContainer.dart';
import '../widgets/Pill.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

enum Display{
  accounts, cards, loans
}

class _OverviewState extends State<Overview> {
  List<bool> pillEnabled = [true, false, false];
  Display display = Display.accounts;

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

    return Column(
      children: [
        DroppedContainer(
          pills: [
            GestureDetector(
              onTap: (){
                inflatePill(0);
              },
              child: Pill(
                text: 'ACCOUNTS',
                isInflated: pillEnabled[0],
              ),
            ),
            GestureDetector(
              onTap: (){
                inflatePill(1);
              },
              child: Pill(
                text: 'CARDS',
                isInflated: pillEnabled[1],
              ),
            ),
            GestureDetector(
              onTap: (){
                inflatePill(2);
              },
              child: Pill(
                text: 'LOANS',
                isInflated: pillEnabled[2],
              ),
            ),
          ],
        ),

        SizedBox(
          height: height*.579,
          child: Builder(
            builder: (context){
              if(Display.cards == display){
                return const Text("Cards");
              }
              else if(Display.loans == display){
                return const Text("Loans");
              }

              return const Accounts();
            },
          ),
        )
      ],
    );
  }
}

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  bool showBalance = false;
  double actualBalance = 1000000;
  double availableBalance = 990000;
  String balanceStars = "* * * * * * * * *";
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                CircleContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                              "SAVINGS ACCOUNT"
                          ),
                          const Text(
                              "0123456789123"
                          ),
                        ],
                      ),


                      Column(
                        children: [
                          const Text(
                              "Actual"
                          ),
                          Text(
                              (showBalance)?actualBalance.toString():balanceStars
                          )
                        ],
                      ),

                      Column(
                        children: [
                          const Text(
                              "Available"
                          ),
                          Text(
                              (showBalance)?availableBalance.toString():balanceStars
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(180.0, 180.0),
                  child: RoundElevatedButton(
                      size: 60,
                      child: Column(
                        children: [
                          (showBalance)?const Icon(Icons.disabled_visible_outlined):const Icon(Icons.remove_red_eye_outlined),
                          (showBalance)?const Text("Hide"):const Text("Balance")
                        ],
                      ),
                      onPressed: (){
                        setState(() {
                          showBalance = !showBalance;
                        });
                      }
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10.0,),
            Container(
              width: 20.0,
              height: 3.0,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 220, 0, 1),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5.0
                    )
                  ]
              ),
            )
          ],
        ),

        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: const CustomCard(
                      child: Icon(
                          Icons.sticky_note_2_outlined
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text(
                      "Statement"
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: const CustomCard(
                      child: Icon(
                          Icons.account_balance_outlined
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text(
                      "Government"
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: const CustomCard(
                      child: Icon(
                          Icons.vertical_align_top_outlined
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text(
                      "Airtime"
                  )
                ],
              ),
              Column(
                children: const [
                  CustomCard(
                    child: Icon(
                        Icons.lightbulb_outline
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                      "LUKU"
                  )
                ],
              )
            ]
        ),


      ],
    );
  }
}

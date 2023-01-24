import 'dart:async';

import 'package:crdb_mobile_app/widgets/RoundElevatedButton.dart';
import 'package:flutter/material.dart';

import '../shared/constraints.dart';
import '../widgets/CircleContainer.dart';
import '../widgets/CustomCard.dart';
import '../widgets/DroppedContainer.dart';
import '../widgets/GlowingIcon.dart';
import '../widgets/InflatedIconButton.dart';
import '../widgets/Pill.dart';
import '../widgets/indicator.dart';
import 'overview/airtime_bundles.dart';
import 'overview/card_selection.dart';
import 'overview/card_settings.dart';
import 'overview/government_payments.dart';
import 'overview/luku.dart';
import 'overview/statements.dart';

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
      body: Column(
        children: [
          DroppedContainer(
            pills: [
              Pill(
                onTap: (){
                  display = Display.accounts;
                  inflatePill(0);
                },
                text: 'ACCOUNTS',
                fontSize: 10,
                isInflated: pillEnabled[0],
              ),
              Pill(
                onTap: (){
                  display = Display.cards;
                  inflatePill(1);
                },
                text: 'CARDS',
                fontSize: 10,
                isInflated: pillEnabled[1],
              ),
              Pill(
                onTap: (){
                  display = Display.loans;
                  inflatePill(2);
                },
                text: 'LOANS',
                fontSize: 10,
                isInflated: pillEnabled[2],
              ),
            ],
          ),

          SizedBox(
            height: height*.593,
            child: SingleChildScrollView(
              child: Builder(
                builder: (context){
                  if(Display.cards == display){
                    return const Cards();
                  }
                  else if(Display.loans == display){
                    return const Loans();
                  }

                  return const Accounts();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Loans extends StatefulWidget {
  const Loans({Key? key}) : super(key: key);

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  String bottomSlideText = "MERCHANT PAYMENTS";

  ScrollController scrollController = ScrollController();
  int pos = 0;
  double scrollPos = 300;
  late final Timer timer;

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(
      const Duration(
        seconds: 3,
      ),
      (timer){
        setState((){
          scrollController.animateTo(pos*350, duration: const Duration(seconds: 1,), curve: Curves.easeIn);
          if(pos < 4){
            ++pos;
          }else{
            pos = 0;
          }
        });
      }
    );
  }

  @override
  void dispose(){
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleContainer(
              height: 200.0, width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Text(
                          "Get instant loan Advance"
                      ),
                      SizedBox(height: vGap,),
                      Text(
                          "An affordable means to get back on track with your finances until payday",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10.0,),
            const Indicator(),
          ],
        ),

        const SizedBox(height: vGap,),
        SizedBox(
          height: 100.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CustomCard(
                      onTap: (){
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) => const Statements()
                        //     )
                        // );
                      },
                      child: const Icon(
                          Icons.monetization_on_outlined
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    const Text(
                        "Apply"
                    )
                  ],
                ),
                Column(
                  children: [
                    CustomCard(
                      onTap: (){
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) => const GovernmentPayments()
                        //     )
                        // );
                      },
                      child: const Icon(
                          Icons.payments_outlined
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    const Text(
                        "Repay"
                    )
                  ],
                ),
                Column(
                  children: [
                    CustomCard(
                      onTap: (){
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) => const AirtimeBundles()
                        //     )
                        // );
                      },
                      child: const Icon(
                          Icons.history_outlined
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    const Text(
                        "History"
                    )
                  ],
                ),
                SizedBox(
                  width: width/5,
                  child: Column(
                    children: [
                      CustomCard(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Luku()
                              )
                          );
                        },
                        child: const Icon(
                            Icons.sticky_note_2_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Expanded(
                        child: Text(
                            "Terms of service",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )

              ]
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "LOANS WE OFFER"
            ),
            SizedBox(
              width: width,
              height: height*.08,
              child: ListView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  CustomCard(
                    width: width*.9,
                    padding: 10.0,
                    child: Row(
                      children: [
                        const Expanded(
                          child: GlowingIcon(
                            icon: Icons.money_outlined,
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Salary advance",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "get up to 1 million",
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                  "3% interest"
                              ),
                              Text(
                                  "pay in 30 days"
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10,),
                  CustomCard(
                    width: width*.9,
                    padding: 10.0,
                    child: Row(
                      children: [
                        const Expanded(
                          child: GlowingIcon(
                            icon: Icons.school,
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Boom advance",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "get up to TZS 120,000",
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                  "no interest"
                              ),
                              Text(
                                  "repay on boom day"
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10,),
                  CustomCard(
                    width: width*.9,
                    padding: 10.0,
                    child: Row(
                      children: [
                        const Expanded(
                          child: GlowingIcon(
                            icon: Icons.directions_walk_sharp,
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Pension Advance",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "get up to 1 million",
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                  "3% interest"
                              ),
                              Text(
                                  "pay in 30 days"
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10,),
                  CustomCard(
                    width: width*.9,
                    padding: 10.0,
                    child: Row(
                      children: [
                        const Expanded(
                          child: GlowingIcon(
                            icon: Icons.monetization_on_outlined,
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Fahari Float",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "get up to 5 million",
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                  "5% interest"
                              ),
                              Text(
                                  "automatic repayment"
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10,),
                  CustomCard(
                    width: width*.9,
                    padding: 10.0,
                    child: Row(
                      children: [
                        const Expanded(
                          child: GlowingIcon(
                            icon: Icons.monetization_on_outlined,
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "personal loan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "get up to 100 million",
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                  "16% interest"
                              ),
                              Text(
                                  "pay in 7 years"
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RoundElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const CardSettings()
                    )
                );
              },
              child: const Icon(
                Icons.settings
              ),
            ),
            const SizedBox(width: 20.0,),
            RoundElevatedButton(
                child: Column(
                  children: const [
                    Icon(
                      Icons.remove_red_eye_outlined
                    ),
                    Text(
                      "Show"
                    )
                  ],
                ),
                onPressed: (){}
            )
          ],
        ),
        const Indicator(),

        const SizedBox(height: vGap,),
        SizedBox(
          height: height*.15,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width/5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCard(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CardSettings()
                            )
                        );
                      },
                      child: const Icon(
                          Icons.lock_outline
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                          "Freeze card"
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                width: width/5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCard(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CardSelection()
                            )
                        );
                      },
                      child: const Icon(
                          Icons.credit_card
                      ),
                    ),
                    const Expanded(
                      child: Text(
                          "Request cards",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                width: width/5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CustomCard(
                      child: Icon(
                          Icons.credit_score_outlined
                      ),
                    ),
                    Expanded(
                      child: Text(
                          "Cards application status",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                width: width/5,
                child: Column(
                  children: const [
                    CustomCard(
                      child: Icon(
                          Icons.shopping_cart_checkout_outlined
                      ),
                    ),
                    Text(
                        "Manage online purchases",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "NOTIFICATIONS"
            ),

            const SizedBox(height: 10.0,),
            CustomCard(
              child: Row(
                children: const [
                  Expanded(
                    child: GlowingIcon(
                      icon: Icons.info_outline,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                        "Enjoy seamless transactions without charges when paying with TemboCard"
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
  String bottomSlideText = "MERCHANT PAYMENTS";

  ScrollController scrollController = ScrollController();
  bool scrolledLeft = false;
  double scrollPos = 350;
  late final Timer timer;

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 5),
            (timer) {
          setState(() {
            if(scrolledLeft){
              bottomSlideText = "MERCHANT PAYMENTS";
              scrollController.animateTo(scrollPos*0, duration: const Duration(milliseconds: 500,), curve: Curves.easeIn);
            }else{
              bottomSlideText = "SHAREHOLDERS REGISTRATION";
              scrollController.animateTo(scrollPos*1, duration: const Duration(milliseconds: 500,), curve: Curves.easeIn);
            }
            scrolledLeft = !scrolledLeft;
          });
        }
    );
  }

  @override
  void dispose(){
    super.dispose();
    timer.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                CircleContainer(
                  height: 200.0, width: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Text(
                              "SAVINGS ACCOUNT"
                          ),
                          Text(
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
                  offset: const Offset(140.0, 140.0),
                  child: RoundElevatedButton(
                      size: 55,
                      child: Column(
                        children: [
                          (showBalance)?const Icon(Icons.disabled_visible_outlined):const Icon(Icons.remove_red_eye_outlined),
                          (showBalance)?const Text("Hide"):const Text("Balance", style: TextStyle(fontSize: 12),)
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
            const Indicator(),
          ],
        ),

        const SizedBox(height: vGap,),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CustomCard(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Statements()
                          )
                      );
                    },
                    child: const Icon(
                        Icons.sticky_note_2_outlined
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text(
                      "Statements"
                  )
                ],
              ),
              Column(
                children: [
                  CustomCard(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const GovernmentPayments()
                          )
                      );
                    },
                    child: const Icon(
                        Icons.account_balance_outlined
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
                  CustomCard(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const AirtimeBundles()
                          )
                      );
                    },
                    child: const Icon(
                        Icons.vertical_align_top_outlined
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text(
                      "Airtime"
                  )
                ],
              ),
              Column(
                children: [
                  CustomCard(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Luku()
                          )
                      );
                    },
                    child: const Icon(
                        Icons.lightbulb_outline
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text(
                      "LUKU"
                  )
                ],
              )
            ]
        ),

        const SizedBox(height: vGap,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bottomSlideText
            ),
            SizedBox(
              width: width,
              height: height*.12,
              child: GestureDetector(
                onHorizontalDragStart: (drag){

                },
                child: ListView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomCard(
                      padding: 20.0,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/logo/crdb_logo.jpeg",
                            scale: 4.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "LIPA HAPA",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Pay direct to merchants quickly",
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    CustomCard(
                      padding: 20.0,
                      child: Row(
                        children: [
                          const CircleContainer(
                            width: 50.0,
                            height: 50.0,
                            child: GlowingIcon(
                              icon: Icons.edit,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Register now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Register for the upcoming AGM meeting",
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        )
      ],
    );
  }
}

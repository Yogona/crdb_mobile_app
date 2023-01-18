import 'package:crdb_mobile_app/shared/colors.dart';
import 'package:crdb_mobile_app/widgets/GradientButton.dart';
import 'package:crdb_mobile_app/widgets/InflatedIconButton.dart';
import 'package:crdb_mobile_app/widgets/PinDot.dart';
import 'package:crdb_mobile_app/widgets/RoundElevatedButton.dart';
import 'package:flutter/material.dart';

import 'Locations.dart';
import 'More.dart';
import 'ScanToPay.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin{
  late final tabBarController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabBarController,
      indicatorColor: Colors.transparent,
      tabs: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const ScanToPay()
                )
            );
          },
          child: const Tab(
            icon: Icon(
                Icons.qr_code_scanner_outlined
            ),
            text: "Scan kulipia",
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const Locations()
              )
            );
          },
          child: const Tab(
            icon: Icon(
                Icons.location_on_outlined
            ),
            text: "Mahali",
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const More()
                )
            );
          },
          child: const Tab(
            icon: Icon(
                Icons.more_horiz_outlined
            ),
            text: "Zaidi",
          ),
        )
      ],
    );
  }
}

class Pin extends StatefulWidget {
  const Pin({Key? key, required this.toggleAuth}) : super(key: key);
  final Function toggleAuth;

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> with TickerProviderStateMixin{
  late final tabBarController = TabController(length: 3, vsync: this);
  List<bool> dotsLit = [false,false,false,false];
  // Color firstDotColor   = Colors.grey;
  // Color secondDotColor  = Colors.grey;
  // Color thirdDotColor   = Colors.grey;
  // Color fourthDotColor  = Colors.grey;

  @override
  void initState(){
    super.initState();
    tabBarController.addListener(() {
      int selected = tabBarController.index;
      print(selected);
      switch(selected){
        case 0: Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const ScanToPay()
            )
        );
        break;
        case 1: print("1");
        break;
        case 2: print("2");
      }
    });
  }

  List<dynamic> pin = [];

  void fillPin(var number){
    if(pin.length < 4){
      pin.add(number);
    }

    //Number of dots helps to know what dot to be marked as enabled
    int dots = pin.length;

    setState(() {
      switch(dots){
        case 1: dotsLit.first = true;
        break;
        case 2: dotsLit[1] = true;
        break;
        case 3: dotsLit[2] = true;
        break;
        case 4: {
          dotsLit[3] = true;
          widget.toggleAuth();
        }
      }
    });
  }

  void deletePin(){
    setState((){
      //We set specific dot to be disabled when user taps delete icon
      dotsLit[pin.length-1] = false;
      pin.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double dragIndent = width*.4;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Ingiza PIN ya SimBanking",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PinDot(isLit: dotsLit.first,),
            PinDot(isLit: dotsLit.elementAt(1),),
            PinDot(isLit: dotsLit.elementAt(2),),
            PinDot(isLit: dotsLit.last,)
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundElevatedButton(
              onPressed: (){
                fillPin("1");
              },
              child: const Text(
                  "1"
              ),
            ),

            RoundElevatedButton(
              onPressed: (){
                fillPin("2");
              },
              child: const Text(
                  "2"
              ),
            ),

            RoundElevatedButton(
              onPressed: (){
                fillPin("3");
              },
              child: const Text(
                  "3"
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundElevatedButton(
              onPressed: (){
                fillPin("4");
              },
              child: const Text(
                  "4"
              ),
            ),

            RoundElevatedButton(
              onPressed: (){
                fillPin("5");
              },
              child: const Text(
                  "5"
              ),
            ),

            RoundElevatedButton(
              onPressed: (){
                fillPin("6");
              },
              child: const Text(
                  "6"
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundElevatedButton(
              onPressed: (){
                fillPin("7");
              },
              child: const Text(
                  "7"
              ),
            ),

            RoundElevatedButton(
              onPressed: (){
                fillPin("8");
              },
              child: const Text(
                  "8"
              ),
            ),

            RoundElevatedButton(
              onPressed: (){
                fillPin("9");
              },
              child: const Text(
                  "9"
              ),
            )
          ],
        ),
        Transform.translate(
          offset: Offset((pin.isNotEmpty)?-20.0:0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: (){
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10.0)
                          )
                      ),
                      context: context,
                      builder: (context){
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Divider(
                                indent: dragIndent,
                                endIndent: dragIndent,
                                color: const Color.fromRGBO(200, 200, 200, 1.0),
                                thickness: 5.0,
                              ),

                              GradientButton(
                                onPressed: (){
                                  print("green");
                                },
                                text: "JINSI YA KUPATA PIN KUPITIA ATM",
                              ),

                              TextButton(
                                onPressed: (){

                                },
                                child: const Text(
                                    "Au tembelea tawi letu lolote kujisajili"
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  );
                },
                child: const Text(
                    "Umesahau?"
                ),
              ),

              RoundElevatedButton(
                onPressed: (){
                  fillPin("0");
                },
                child: const Text(
                    "0"
                ),
              ),

              (pin.isNotEmpty)?IconButton(
                onPressed: (){
                  deletePin();
                },
                icon: const Icon(
                    Icons.arrow_back
                ),
              ):
              const SizedBox(width: 90.0,),
            ],
          ),
        ),
        // TabBar(
        //   controller: tabBarController,
        //   indicatorColor: Colors.transparent,
        //   tabs: const [
        //     Tab(
        //       icon: Icon(
        //           Icons.qr_code_scanner_outlined
        //       ),
        //       text: "Scan kulipia",
        //     ),
        //     Tab(
        //       icon: Icon(
        //           Icons.location_on_outlined
        //       ),
        //       text: "Mahali",
        //     ),
        //     Tab(
        //       icon: Icon(
        //           Icons.more_horiz_outlined
        //       ),
        //       text: "Zaidi",
        //     )
        //   ],
        // )
      ],
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key, required this.toggleAuth,}) : super(key: key);
  final Function toggleAuth;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>{

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
      body: Column(
        children: [
          Expanded(flex: 7,child: Pin(toggleAuth: widget.toggleAuth,)),
          const Expanded(child: BottomBar()),
        ],
      ),
    );
  }
}
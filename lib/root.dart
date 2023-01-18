import 'package:crdb_mobile_app/screens/overview.dart';
import 'package:crdb_mobile_app/widgets/DroppedContainer.dart';
import 'package:crdb_mobile_app/widgets/InflatedIconButton.dart';
import 'package:crdb_mobile_app/widgets/Pill.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key, required this.toggleAuth,}) : super(key: key);
  final Function toggleAuth;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
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
          body: const TabBarView(
            children: [
              Overview(),
              Text(
                "Transfers"
              ),
              Text(
                  "Cashout"
              ),
              Text(
                  "Payments"
              ),
              Text(
                  "Settings"
              ),
            ],
          ),
          bottomNavigationBar: const TabBar(
            labelPadding: EdgeInsets.only(
              bottom: 30.0,
            ),
            labelColor: Color.fromRGBO(0, 210, 0, 1.0),
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              boxShadow: [
                // BoxShadow(
                //   color: Color.fromRGBO(0, 255, 0, 0.4),
                //   blurRadius: 30.0,
                //   blurStyle: BlurStyle.normal
                // ),
                BoxShadow(
                  color: Color.fromRGBO(0, 255, 0, 1),
                  blurRadius: 100.0,
                  offset: Offset(0.0, 100.0)
                )
              ]
            ),
            tabs: [
              Tab(
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                ),
                text: "Overview",
              ),
              Tab(
                icon: Icon(
                    Icons.compare_arrows_outlined
                ),
                text: "Transfers",
              ),
              Tab(
                icon: Icon(
                    Icons.card_membership_outlined
                ),
                text: "Cashout",
              ),
              Tab(
                icon: Icon(
                    Icons.payments
                ),
                text: "Payments",
              ),
              Tab(
                icon: Icon(
                    Icons.settings
                ),
                text: "Settings",
              ),
            ],
          ),
        )
    );
  }
}

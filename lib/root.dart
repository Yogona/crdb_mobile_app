import 'package:crdb_mobile_app/screens/cashout.dart';
import 'package:crdb_mobile_app/screens/overview.dart';
import 'package:crdb_mobile_app/screens/payments.dart';
import 'package:crdb_mobile_app/screens/settings.dart';
import 'package:crdb_mobile_app/screens/transfers.dart';
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
enum Display{
  overview, transfers
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: [
              Overview(),
              SafeArea(child: Transfers()),
              Cashout(),
              SafeArea(child: Payments()),
              SafeArea(child: Settings()),
            ],
          ),
          bottomNavigationBar: TabBar(
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
        ),
    );
  }
}

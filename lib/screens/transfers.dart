import 'package:crdb_mobile_app/screens/transfers/cardless.dart';
import 'package:crdb_mobile_app/screens/transfers/crdb_accounts.dart';
import 'package:crdb_mobile_app/screens/transfers/mobile_networks.dart';
import 'package:crdb_mobile_app/screens/transfers/other_banks.dart';
import 'package:flutter/material.dart';

import '../shared/constraints.dart';
import '../widgets/CustomCard.dart';

class Transfers extends StatefulWidget {
  const Transfers({Key? key}) : super(key: key);

  @override
  State<Transfers> createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(
            flex: 1,
            child: Text(
                "TRANSFERS"
            ),
          ),

          // const SizedBox(height: vGap,),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CustomCard(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CrdbAccounts()
                              )
                          );
                        },
                        child: const Icon(
                            Icons.arrow_right_alt
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "CRDB account"
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CustomCard(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const OtherBanks()
                              )
                          );
                        },
                        child: const Icon(
                            Icons.account_balance_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Other banks"
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CustomCard(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const MobileNetworks()
                              )
                          );
                        },
                        child: const Icon(
                            Icons.send_to_mobile_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Mobile networks"
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CustomCard(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Cardless()
                              )
                          );
                        },
                        child: const Icon(
                            Icons.card_membership_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Cardless"
                      )
                    ],
                  )
                ]
            ),
          ),

          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.star_border_outlined,
                  color: Colors.red,
                  size: 50,
                ),
                Text(
                  "No favourites",
                  style: TextStyle(
                      color: Colors.red
                  ),
                ),
                SizedBox(height: vGap,),
                Text(
                  "At the end of your transaction you can add the payee to favourites",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

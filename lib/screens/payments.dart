import 'package:flutter/material.dart';

import '../Insurance.dart';
import '../shared/constraints.dart';
import '../stocks_and_rates.dart';
import '../widgets/CustomCard.dart';
import '../widgets/InflatedIconButton.dart';
import '../widgets/RoundElevatedButton.dart';
import '../widgets/fading_line.dart';
import 'overview/airtime_bundles.dart';
import 'overview/government_payments.dart';
import 'overview/luku.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                    child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                          Icons.search
                      ),
                    hintText: "Search for services",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)
                    ),
                  ),
                )),

                Expanded(
                  flex: 2,
                  child: InflatedIconButton(
                    child: Icon(
                        Icons.search
                    ),
                    onPressed: (){

                    },
                  ),
                )

              ],
            ),

            const SizedBox(height: vGap,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                    "TOP CATEGORIES"
                ),
                Row(
                  children: const [
                    Text(
                        "SEE ALL"
                    ),
                    Icon(
                        Icons.arrow_right
                    )
                  ],
                ),
              ],
            ),

            SizedBox(
              height: height*.5,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisExtent: 100.0
                ),
                children: [
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
                          "Airtime and bundles",
                        textAlign: TextAlign.center,
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
                            Icons.live_tv_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "TV"
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
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) => const AirtimeBundles()
                          //     )
                          // );
                        },
                        child: const Icon(
                            Icons.school_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Education"
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
                            Icons.flight_takeoff_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Airline"
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
                            Icons.water_drop_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Water bills"
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
                            Icons.qr_code_scanner_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "QR payments"
                      )
                    ],
                  ),

                  Column(
                    children: [
                      CustomCard(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Insurance()
                              )
                          );
                        },
                        child: const Icon(
                            Icons.admin_panel_settings_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Insurance"
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
                            Icons.medical_services_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Hospitals"
                      )
                    ],
                  ),

                  Column(
                    children: [
                      CustomCard(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const StocksAndRates()
                              )
                          );
                        },
                        child: const Icon(
                            Icons.auto_graph_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Stocks and rates",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),

                  Column(
                    children: [
                      CustomCard(
                        onTap: (){
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) => const StocksAndRates()
                          //     )
                          // );
                        },
                        child: const Icon(
                            Icons.airplane_ticket_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                        "Tickets",
                        textAlign: TextAlign.center,
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
                            Icons.auto_graph_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Investments"
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
                            Icons.gamepad_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "Gaming"
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
                            Icons.more_horiz_outlined
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                          "More payments",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: vGap,),
            const FadingLine(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                    "FOR YOU"
                ),
                Row(
                  children: const [
                    Text(
                        "MORE"
                    ),
                    Icon(
                        Icons.arrow_right
                    )
                  ],
                ),
              ],
            ),

            CustomCard(
              spreadRadius: 0.0,
              blurRadius: 0.0,
              offset: const Offset(0.0,0.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Icon(
                        Icons.favorite
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                        "Favourites and recent"
                    ),
                  ),
                  Expanded(
                    child: Icon(
                        Icons.arrow_right
                    ),
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

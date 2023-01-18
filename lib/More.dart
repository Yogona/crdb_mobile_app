import 'package:crdb_mobile_app/Insurance.dart';
import 'package:crdb_mobile_app/stocks_and_rates.dart';
import 'package:crdb_mobile_app/widgets/CustomCard.dart';
import 'package:crdb_mobile_app/widgets/GlowingIcon.dart';
import 'package:crdb_mobile_app/widgets/InflatedIconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import 'Locations.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Spread the word',
        text: 'Share CRDB link with your friends.',
        linkUrl: 'https://crdb.co.tz/',
        chooserTitle: 'Share CRDB.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "More"
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
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal:20.0,
          vertical: 30.0
        ),
        children: [
          GestureDetector(
            onTap: () async {
              await share();
            },
            child: CustomCard(
              child: Row(
                children: const [
                  Expanded(
                    child: GlowingIcon(
                      icon: Icons.info_outline,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                        "Invite friends & share the experience"
                    ),
                  ),
                  Expanded(
                    child: Icon(
                        Icons.arrow_right
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0,),
          const Text(
              "CRDB"
          ),
          const SizedBox(height: 5.0,),
          SizedBox(
            height: 235.0,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0
              ),
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Locations()
                        )
                    );
                  },
                  child: CustomCard(
                    padding: 15.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          size: 25.0,
                        ),
                        Text(
                            "Location"
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const StocksAndRates()
                        )
                    );
                  },
                  child: CustomCard(
                    padding: 15.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.auto_graph_outlined,
                          size: 25.0,
                        ),
                        Text(
                            "Stocks & rates"
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Insurance()
                        )
                    );
                  },
                  child: CustomCard(
                    padding: 15.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.gpp_good_outlined,
                          size: 25.0,
                        ),
                        Text(
                            "Insurance"
                        )
                      ],
                    ),
                  ),
                ),
                CustomCard(
                  padding: 15.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.groups_outlined,
                        size: 25.0,
                      ),
                      Text(
                          "Shareholders"
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0,),
          const Text(
              "SUPPORT"
          ),
          const SizedBox(height: 5.0,),

          Row(
            children: [
              Expanded(
                child: CustomCard(
                  padding: 15.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.chat,
                        size: 25.0,
                      ),
                      Text(
                          "Chat"
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10.0,),
              Expanded(
                child: CustomCard(
                  padding: 15.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.question_mark,
                        size: 25.0,
                      ),
                      Text(
                          "FAQ"
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20.0,),
          const Text(
              "CONNECT WITH US"
          ),
          const SizedBox(height: 5.0,),
          const SizedBox(height: 20.0,),
          const Text(
              "CONTACT US"
          ),
          const SizedBox(height: 5.0,),
        ],
      ),
    );
  }
}

import 'package:crdb_mobile_app/widgets/CustomCard.dart';
import 'package:flutter/material.dart';

import '../../widgets/InflatedIconButton.dart';

class CardSelection extends StatelessWidget {
  const CardSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: const [
            Text(
                "Card selection"
            ),
            Text(
              "Step 1 of 3",
              style: TextStyle(
                fontSize: 14.0
              ),
            )
          ],
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select the card that you want",
              style: TextStyle(
                fontSize: 18.0
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Container(
                    color: Colors.green, width: 20.0, height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "VISA TZS"
                      ),
                      Text(
                        "Tap to see the features and apply for this card"
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_right
                  )
                ],
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Container(
                    color: Colors.green, width: 20.0, height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          "VISA GOLD TZS"
                      ),
                      Text(
                          "Tap to see the features and apply for this card"
                      )
                    ],
                  ),
                  const Icon(
                      Icons.arrow_right
                  )
                ],
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Container(
                    color: Colors.green, width: 20.0, height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          "UNION PAY TZS"
                      ),
                      Text(
                          "Tap to see the features and apply for this card"
                      )
                    ],
                  ),
                  const Icon(
                      Icons.arrow_right
                  )
                ],
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Container(
                    color: Colors.green, width: 20.0, height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          "VISA GOLD STAFF"
                      ),
                      Text(
                          "Tap to see the features and apply for this card"
                      )
                    ],
                  ),
                  const Icon(
                      Icons.arrow_right
                  )
                ],
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Container(
                    color: Colors.green, width: 20.0, height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          "VISA PLATNUM TZS"
                      ),
                      Text(
                          "Tap to see the features and apply for this card"
                      )
                    ],
                  ),
                  const Icon(
                      Icons.arrow_right
                  )
                ],
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Container(
                    color: Colors.green, width: 20.0, height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          "VISA INFINITE TZS"
                      ),
                      Text(
                          "Tap to see the features and apply for this card"
                      )
                    ],
                  ),
                  const Icon(
                      Icons.arrow_right
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

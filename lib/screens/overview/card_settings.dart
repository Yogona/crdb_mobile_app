import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';

import '../../widgets/InflatedIconButton.dart';

class CardSettings extends StatefulWidget {
  const CardSettings({Key? key}) : super(key: key);

  @override
  State<CardSettings> createState() => _CardSettingsState();
}

class _CardSettingsState extends State<CardSettings> {
  bool cardEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Card settings"
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
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SECURITY"
            ),
            Card(
              child: Row(
                children: [
                  const Expanded(
                    child: Icon(
                        Icons.settings
                    ),
                  ),

                  const Expanded(
                    flex: 5,
                    child: Text(
                        "Card Off/On"
                    ),
                  ),

                  Expanded(
                    child: SwitcherButton(
                        offColor: Colors.white,
                        onColor: const Color.fromRGBO(0, 220, 0, 1),
                        value: cardEnabled,
                        onChange: (val){

                        }
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

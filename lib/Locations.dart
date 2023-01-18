import 'package:crdb_mobile_app/widgets/DroppedContainer.dart';
import 'package:crdb_mobile_app/widgets/InflatedIconButton.dart';
import 'package:crdb_mobile_app/widgets/Pill.dart';
import 'package:flutter/material.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Locations"
        ),
        actions: [
          InflatedIconButton(
            onPressed: (){

            },
            child: const Icon(
              Icons.search,
              size: 20.0,
            ),
          )
        ],
      ),
      body: Column(
        children: const [
          DroppedContainer(
            pills: [
              Expanded(
                child: Pill(
                  text: "All",
                  isInflated: true,
                ),
              ),
              Expanded(
                child: Pill(
                  text: "ATM",
                  isInflated: false,
                ),
              ),
              Expanded(
                child: Pill(
                  text: "Nearest/Preferred Branch",
                  isInflated: false,
                ),
              ),
              Expanded(
                  child: Pill(
                    text: "Agents",
                    isInflated: false,
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}

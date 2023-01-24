import 'package:crdb_mobile_app/widgets/GlowingIcon.dart';
import 'package:flutter/material.dart';

import '../../shared/constraints.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/DecoratedSelection.dart';
import '../../widgets/DroppedContainer.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/InflatedIconButton.dart';
import '../../widgets/Pill.dart';

class Statements extends StatefulWidget {
  const Statements({Key? key}) : super(key: key);

  @override
  State<Statements> createState() => _StatementsState();
}

enum Display{
  mini, history, full
}

class _StatementsState extends State<Statements> {
  List<bool> pillEnabled = [true, false, false];

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "Statements"
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DroppedContainer(
            pills: [
              Pill(
                onTap: (){
                  inflatePill(0);
                },
                text: 'MINI',
                fontSize: 13,
                isInflated: pillEnabled[0],
              ),
              Pill(
                onTap: (){
                  inflatePill(1);
                },
                text: 'HISTORY',
                fontSize: 13,
                isInflated: pillEnabled[1],
              ),
              Pill(
                onTap: (){
                  inflatePill(2);
                },
                text: 'FULL',
                fontSize: 13,
                isInflated: pillEnabled[2],
              ),
            ],
          ),
          Builder(
              builder: (context){
                for(int index = 0; index < pillEnabled.length; ++index){
                  if(index == 0 && pillEnabled[index]){
                    return const Mini();
                  }
                  else if(index == 1 && pillEnabled[index]){
                    return const History();
                  }
                  else if(index == 2 && pillEnabled[index]){
                    return const Full();
                  }
                }

                return const Placeholder();
              }
          )
        ],
      ),
    );
  }
}

class Full extends StatefulWidget {
  const Full({Key? key}) : super(key: key);

  @override
  State<Full> createState() => _FullState();
}
enum Date{
  from, to
}
class _FullState extends State<Full> {
  List<bool> cardsStates = List.filled(6, false);

  void selectCard(int index){
    selectedPeriodText = "Select period (Tap calendar to change dates)";
    //Sets all unselected so it avoids multi selection
    for(int i = 0; i < cardsStates.length; ++i){
      cardsStates[i] = false;
    }
    cardsStates[index] = true;
  }

  String selectedPeriodText = "Select period";
  DateTime fromDate = DateTime.now();
  DateTime toDate   = DateTime.now();

  String sFromDate  = "DD/MM/YYYY";
  String sToDate    = "DD/MM/YYYY";

  void selectDate(Date date){
    showModalBottomSheet(context: context, builder: (context){
      return Column(
        children: [
          const Text(
              "Select the start date"
          ),
          CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1900, 1, 1),
              lastDate: DateTime.now(),
              onDateChanged: (val){
                setState((){
                  if(date == Date.from){
                    fromDate = val;
                    sFromDate = fromDate.toString().split(" ")[0];
                  }else{
                    toDate = val;
                    sToDate = toDate.toString().split(" ")[0];
                  }
                });

                Navigator.of(context).pop();
              }
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: height*.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(
                child: GlowingIcon(
                  icon: Icons.info_outline,
                ),
              ),
              Expanded(
                flex: 10,
                child: Text(
                    "Full statement will be sent to your email shortly"
                ),
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Full statement for"
              ),
              SizedBox(height: 10.0,),
              DecoratedSelection(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Select account"
                ),
                items: [
                  DropdownMenuItem(
                    value: "0123456789012",
                    child: Text(
                        "0123456789012"
                    ),
                  ),
                ],
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedPeriodText
              ),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: height*.2,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0, mainAxisExtent: 50.0
                  ),
                  children: [
                    CustomCard(
                      onTap: (){
                        setState(() {
                          selectCard(0);
                          sToDate = toDate.toString().split(" ")[0];
                          sFromDate = toDate.subtract(const Duration(days: 30)).toString().split(" ")[0];
                        });
                      },
                      selected: cardsStates[0],
                      child: const Center(
                        child: Text(
                          "1 month"
                        )
                      ),
                    ),
                    CustomCard(
                      onTap: (){
                        setState(() {
                          selectCard(1);
                          sToDate = toDate.toString().split(" ")[0];
                          sFromDate = toDate.subtract(const Duration(days: 30*2)).toString().split(" ")[0];
                        });
                      },
                      selected: cardsStates[1],
                      child: const Center(
                          child: Text(
                              "2 months"
                          )
                      ),
                    ),
                    CustomCard(
                      onTap: (){
                        setState(() {
                          selectCard(2);
                          sToDate = toDate.toString().split(" ")[0];
                          sFromDate = toDate.subtract(const Duration(days: 30*3)).toString().split(" ")[0];
                        });
                      },
                      selected: cardsStates[2],
                      child: const Center(
                          child: Text(
                              "3 months"
                          )
                      ),
                    ),
                    CustomCard(
                      onTap: (){
                        setState(() {
                          selectCard(3);
                          sToDate = toDate.toString().split(" ")[0];
                          sFromDate = toDate.subtract(const Duration(days: 30*6)).toString().split(" ")[0];
                        });
                      },
                      selected: cardsStates[3],
                      child: const Center(
                          child: Text(
                              "6 months"
                          )
                      ),
                    ),
                    CustomCard(
                      onTap: (){
                        setState(() {
                          selectCard(4);
                          sToDate = toDate.toString().split(" ")[0];
                          sFromDate = toDate.subtract(const Duration(days: 30*12)).toString().split(" ")[0];
                        });
                      },
                      selected: cardsStates[4],
                      child: const Center(
                          child: Text(
                              "12 months"
                          )
                      ),
                    ),
                    CustomCard(
                      onTap: (){
                        setState(() {
                          selectCard(5);
                          selectedPeriodText = "Select the start and end dates";
                          sFromDate = "DD/MM/YYYY";
                          sToDate = "DD/MM/YYYY";
                        });
                      },
                      selected: cardsStates[5],
                      child: const Center(
                          child: Text(
                              "Custom"
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Selected period"
              ),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      onTap: (){
                        selectDate(Date.from);
                      },
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(
                                Icons.calendar_month_outlined
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  "From"
                              ),
                              Text(
                                  sFromDate
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: CustomCard(
                      onTap: (){
                        selectDate(Date.to);
                      },
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(
                                Icons.calendar_month_outlined
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  "To"
                              ),
                              Text(
                                  sToDate
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Enter email address"
              ),
              const SizedBox(height: 10.0,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "someone@example.com"
                ),
              )
            ],
          ),

          Row(
            children: [
              Expanded(
                child: GradientButton(
                  onPressed: (){

                  },
                  text: "PROCEED",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: height*.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "View the last 20 transactions done within the app",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
              SizedBox(height: vGap,),
              Text(
                  "History for"
              ),
              SizedBox(height: 10.0,),
              DecoratedSelection(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Select account"
                ),
                items: [
                  DropdownMenuItem(
                    value: "0123456789012",
                    child: Text(
                        "0123456789012"
                    ),
                  ),
                ],
              )
            ],
          ),

          Row(
            children: [
              Expanded(
                child: GradientButton(
                  onPressed: (){

                  },
                  text: "PROCEED",
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}


class Mini extends StatefulWidget {
  const Mini({Key? key}) : super(key: key);

  @override
  State<Mini> createState() => _MiniState();
}

class _MiniState extends State<Mini> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: height*.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                  "Ministatement for the last 10 transactions",
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              SizedBox(height: vGap,),
              Text(
                  "Ministatement for"
              ),
              SizedBox(height: 10.0,),
              DecoratedSelection(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Select account"
                ),
                items: [
                  DropdownMenuItem(
                    value: "0123456789012",
                    child: Text(
                        "0123456789012"
                    ),
                  ),
                ],
              )
            ],
          ),

          Row(
            children: [
              Expanded(
                child: GradientButton(
                  onPressed: (){

                  },
                  text: "PROCEED",
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}

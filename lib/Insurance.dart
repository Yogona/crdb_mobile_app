import 'package:crdb_mobile_app/shared/constraints.dart';
import 'package:crdb_mobile_app/widgets/CircleContainer.dart';
import 'package:crdb_mobile_app/widgets/CustomCard.dart';
import 'package:crdb_mobile_app/widgets/GlowingIcon.dart';
import 'package:crdb_mobile_app/widgets/GradientButton.dart';
import 'package:crdb_mobile_app/widgets/InflatedIconButton.dart';
import 'package:flutter/material.dart';

class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}
enum Display{
  insurance,
  history,
  lodge,
  quote,
  premium
}
class _InsuranceState extends State<Insurance> {
  Display display = Display.insurance;

  void backToInsurance(){
    setState((){
      display = Display.insurance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Insurance"
        ),
        actions: [
          InflatedIconButton(
              child: const Icon(
                Icons.chat
              ),
              onPressed: (){

              }
          )
        ],
      ),
      body: Builder(
        builder: (context){
          if(display == Display.history){
            return const ViewHistory();
          }
          else if(display == Display.lodge){
            return LodgeClaim(goToInsurance: backToInsurance,);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: CircleContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Relax",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "insurance madeeasy",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "easy",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),

                      Text(
                          "Enjoy a seamless way"
                      ),
                      Text(
                          "to be insured"
                      )
                    ],
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              display = Display.history;
                            });
                          },
                          child: const CustomCard(
                            child: Icon(
                                Icons.history_outlined
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        const Text(
                            "View History"
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            //We pop twice because we want to reach PIN screen
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const CustomCard(
                            child: Icon(
                                Icons.login
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        const Text(
                            "Login to pay"
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              display = Display.lodge;
                            });
                          },
                          child: const CustomCard(
                            child: Icon(
                                Icons.style
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        const Text(
                            "Lodge claim"
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        CustomCard(
                          child: Icon(
                              Icons.sticky_note_2_outlined
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                            "Get quote"
                        )
                      ],
                    )
                  ]
              ),

              Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "DID YOU KNOW?"
                    ),
                    CustomCard(
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
                                "You can a new quote after calculating how much you need to pay for car insurance."
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    Row(
                      children: [
                        Expanded(
                          child: GradientButton(
                            onPressed: (){

                            },
                            text: "CALCULATE PREMIUM",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class LodgeClaim extends StatelessWidget {
  const LodgeClaim({Key? key, required this.goToInsurance}):super(key: key);
  final Function goToInsurance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const GlowingIcon(
                  icon: Icons.info_outline,
                  size: 150.0,
                ),

                const Text(
                  "Lodge claim",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: vGap,),
                const Text(
                  "Visit your nearest branch with the following to file a claim",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: vGap,),
                Container(
                  height: 1.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        stops: [0.0, 0.5, 1.0],
                        colors: [
                          Color.fromRGBO(0, 200, 0, .0),
                          Color.fromRGBO(0, 255, 0, 1),
                          Color.fromRGBO(0, 200, 0, .0),
                        ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 180, 0, 1),
                        spreadRadius: 1.0,
                        blurRadius: 5.0,
                      )
                    ]
                  ),
                ),

                const SizedBox(height: vGap,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "1. Copy of driving license"
                    ),
                    Text(
                        "2. Copy of vehicle registration card"
                    ),
                    Text(
                        "3. Vehicle inspection report"
                    ),
                    Text(
                        "4. Sketch map"
                    ),
                    Text(
                        "5. Repair estimate or proforma invoice"
                    ),
                    Text(
                        "6. Pictures"
                    ),
                    Text(
                        "7. Police report PF 90, PF 115"
                    ),
                  ],
                )
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: GradientButton(
                  onPressed: (){
                    goToInsurance();
                  },
                  text: "OK GOT IT",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


class ViewHistory extends StatefulWidget {
  const ViewHistory({Key? key}) : super(key: key);

  @override
  State<ViewHistory> createState() => _ViewHistoryState();
}

enum HistoryDisplay{
  numberEntrance,
  insuranceDetails
}

class _ViewHistoryState extends State<ViewHistory> {
  HistoryDisplay historyDisplay = HistoryDisplay.numberEntrance;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        if(HistoryDisplay.insuranceDetails == historyDisplay){
          return const InsuranceDetails();
        }

        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Provide information below to view history or renew policy",
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),

                  const SizedBox(height: vGap,),
                  const Text(
                      "Phone number"
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "0714197700",
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: GradientButton(
                        text: "PROCEED",
                        onPressed: (){
                          setState(() {
                            historyDisplay = HistoryDisplay.insuranceDetails;
                          });
                        }
                    ),
                  )

                ],
              )

            ],
          ),
        );
      },
    );
  }
}

class InsuranceDetails extends StatefulWidget {
  const InsuranceDetails({Key? key}) : super(key: key);

  @override
  State<InsuranceDetails> createState() => _InsuranceDetailsState();
}

class _InsuranceDetailsState extends State<InsuranceDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Provide insurance details to calculate cost",
                style: TextStyle(
                    fontSize: 22
                ),
              ),

              const SizedBox(height: vGap,),
              const Text(
                  "Insurance class"
              ),
              Stack(
                children: [
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                      items: const [
                        DropdownMenuItem(
                          value: "private",
                          child: Text(
                              "Private"
                          ),
                        ),
                        DropdownMenuItem(
                          value: "motorcycle",
                          child: Text(
                              "Motorcycle"
                          ),
                        )
                      ],
                      onChanged: (val){

                      }
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4.0),
                        )
                    ),
                    width: 5.0,
                    height: 48.0,
                  ),
                ],
              ),

              const SizedBox(height: vGap,),
              const Text(
                  "Value"
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "15,000,000",
                ),
              ),

              const SizedBox(height: vGap,),
              const Text(
                  "Registration number"
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "T000XXX",
                ),
              )
            ],
          ),

          Row(
            children: [
              Expanded(
                child: GradientButton(
                    text: "CALCULATE",
                    onPressed: (){
                      setState(() {

                      });
                    }
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}


import 'dart:async';

import 'package:crdb_mobile_app/shared/constraints.dart';
import 'package:crdb_mobile_app/shared/themes.dart';
import 'package:crdb_mobile_app/widgets/DroppedContainer.dart';
import 'package:crdb_mobile_app/widgets/InflatedIconButton.dart';
import 'package:crdb_mobile_app/widgets/Pill.dart';
import 'package:crdb_mobile_app/widgets/RoundElevatedButton.dart';
import 'package:flutter/material.dart';

class StocksAndRates extends StatefulWidget {
  const StocksAndRates({Key? key}) : super(key: key);

  @override
  State<StocksAndRates> createState() => _StocksAndRatesState();
}

class _StocksAndRatesState extends State<StocksAndRates> {
  List<bool> pillEnabled = [true, false];
  //Buy means bank buys, the same applies to sell
  List<Map<String, dynamic>> currencies = [
    {"currency":"TZS", "sell":1.00, "buy":1.00, "flag_location":"assets/images/flags/square_128/Tanzania_flag.png"},
    {'currency':"USD", "buy":2328.00, "sell":2375.00, 'flag_location':'assets/images/flags/square_128/usa_copy.png'},
    {"currency":"EUR", "buy":2431.00, "sell":2561.00, 'flag_location':"assets/images/flags/square_128/euro_flag.jpeg"},
    {"currency":"JPY", "buy":15.00, "sell":20.00, "flag_location":"assets/images/flags/square_128/JAPAN_copy.png"},
    {"currency":"GBP", "buy":2790.00, "sell":2920.00, "flag_location":"assets/images/flags/square_128/britain_copy.png"},
    {"currency":"CHF", "buy":2506.00, "sell":2556.00, "flag_location":"assets/images/flags/square_128/Switzerland_copy.png"},
    // , "", "", "", "", "", "CAD", "AUD", "SEK", "DKK", "NOK", "XAU", "KES", "UGX", "ZAR", "ZMW", "MWK", "MZM", "BWP", "BIF", "NZD", "SAR", "HKD", "SGD", "INR", "PKR",
    // "AED", "SDR", "CNY", "OMR"
  ];

  //Data holders
  //Initial customer selling currency is set to USD
  late String buyCurrency = currencies[1]['currency'];
  //Initial customer buying currency is set to TZS
  late String sellCurrency = currencies[0]['currency'];

  //Controllers input for customers selling price
  final TextEditingController buyTextController = TextEditingController();
  //Controllers input for customers buying price
  final TextEditingController sellTextController = TextEditingController();

  void inflatePill(int index){
    setState(() {
      //Set all pills to not inflated
      pillEnabled.setAll(0, [false,false]);
      //Now specified pill is inflated
      pillEnabled[index] = true;
    });
  }
  
  @override
  void initState(){
    super.initState();
    buyTextController.text = currencies[0]['buy'].toString();
    sellTextController.text = currencies[1]['buy'].toString();
    prepareFxRatios();
  }

  double exchangeRate = 0.0;

  void prepareFxRatios(){
    double baseBuy    = 0.0;
    double baseSell   = 0.0;
    double quoteBuy   = 0.0;
    double quoteSell  = 0.0;

    currencies.map((currency){
      if(currency['currency'] == buyCurrency){
        baseBuy = currency['buy'];
        baseSell = currency['sell'];
      }

      if(currency['currency'] == sellCurrency){
        quoteBuy = currency['buy'];
        quoteSell = currency['sell'];
      }
    }).toList();

    //We divide so as to get exchange ratio
    /*
      Here we give a currency to receive TZS noted by baseBuy, then order to receive the currency we wanted we would give away what TZS we have so when divided by quote currency which
      is quoteSell we will be able to get that quote currency as long as that quote currency is evaluated by quoteSell TZS.
     */
    exchangeRate = baseBuy/quoteSell;
  }

  double calculateBuyingPrice(){
    try{
      //We divide because we want base currency
      return double.parse(sellTextController.text)/exchangeRate;
    }catch(e){
      return 0.0;
    }
  }

  double calculateSellingPrice(){
   try{
     //We multiply because we need to get quote currency
     return exchangeRate*double.parse(buyTextController.text);
   }catch(e){
     return 0.0;
   }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: const [
            Text(
                "Updated 2023/01/10"
            ),
            Text(
              "11:33:01",
              style: TextStyle(
                fontSize: 14
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
      body: ListView(
        children: [
          DroppedContainer(
            vMargin: 20.0,
            pills: [
              GestureDetector(
                onTap: (){
                  inflatePill(0);
                },
                child: Pill(
                  text: "Exchange rates",
                  isInflated: pillEnabled[0],
                ),
              ),
              GestureDetector(
                onTap: (){
                  inflatePill(1);
                },
                child: Pill(
                  text: "DSE Highlights",
                  isInflated: pillEnabled[1],
                ),
              ),
            ],
          ),
          SizedBox(
            height: height*.7,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Currency I have"
                    ),
                    Text(
                        "Currency I want"
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          filled: true, fillColor: Color.fromRGBO(230, 230, 230, 1.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              )
                          ),
                        ),
                          value: buyCurrency,
                          items: currencies.map((currency){
                            return DropdownMenuItem(
                              value: currency['currency'],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: Image.asset(currency['flag_location'],).image,
                                  ),
                                  Text(
                                      currency['currency']
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (val){
                            buyCurrency = val.toString();
                            Timer(
                                const Duration(
                                  seconds: 1,
                                ),
                                    (){
                                  prepareFxRatios();
                                  double sellPrice = calculateSellingPrice();
                                  sellTextController.text = sellPrice.toString();
                                }
                            );
                          }
                      ),
                    ),
                    RoundElevatedButton(
                        child: const Icon(
                          Icons.compare_arrows
                        ),
                        onPressed: (){

                        }
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            filled: true, fillColor: Color.fromRGBO(230, 230, 230, 1.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.transparent
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.transparent
                                )
                            ),
                          ),
                          value: sellCurrency,
                          items: currencies.map((currency){
                            return DropdownMenuItem(
                              value: currency['currency'],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: Image.asset(currency['flag_location'],).image,
                                  ),
                                  Text(
                                      currency['currency']
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (val){
                            sellCurrency = val.toString();
                            Timer(
                              const Duration(
                                seconds: 1,
                              ),
                                (){
                                  prepareFxRatios();
                                  double buyPrice = calculateBuyingPrice();
                                  buyTextController.text = buyPrice.toString();
                                }
                            );
                          }
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 10.0,),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          controller: buyTextController,
                          onChanged: (val){
                            double sellPrice = calculateSellingPrice();
                            sellTextController.text = sellPrice.toString();
                          },
                        )
                    ),
                    const SizedBox(width: 50.0,),
                    Expanded(
                        child: TextFormField(
                          controller: sellTextController,
                          onChanged: (val){
                            double buyPrice = calculateBuyingPrice();
                            buyTextController.text = buyPrice.toString();
                          },
                        )
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search currency",
                          prefixIcon: const Icon(
                              Icons.search
                          ),
                          enabledBorder: defaultOutlineBorder.copyWith(
                              borderRadius: BorderRadius.circular(50.0)
                          ),
                          focusedBorder: defaultOutlineBorder.copyWith(
                              borderRadius: BorderRadius.circular(50.0)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InflatedIconButton(
                        onPressed: (){

                        },
                        child: Icon(
                          Icons.notifications_none
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: vGap,),

                SizedBox(
                  height: 500.0,
                  child: ListView.separated(
                      itemBuilder: (context, index){
                        if(index > 0){
                          Map<String, dynamic> currency = currencies[index];
                          String flagLocation = currency['flag_location'];
                          String symbol       = currency['currency'];
                          double buyPrice     = currency['buy'];
                          double sellPrice    = currency['sell'];

                          return Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: Image.asset(flagLocation).image,
                                    ),
                                    const SizedBox(width: 10.0,),
                                    Text(
                                      symbol
                                    )
                                  ],
                                )
                              ),

                              Expanded(
                                child: Text(
                                  buyPrice.toString()
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  sellPrice.toString()
                                ),
                              ),

                              const Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(0, 200, 0, 1),
                              )
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                      separatorBuilder: (context, index){
                        return const Divider();
                      },
                      itemCount: currencies.length
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

import 'package:crdb_mobile_app/widgets/InflatedIconButton.dart';
import 'package:crdb_mobile_app/widgets/RoundElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';

import '../widgets/CustomCard.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: Image.network(
                      "https://th.bing.com/th/id/R.0771e184dbb04e47c667d38c6e6bb6df?rik=sprfZaNYE%2bvU1A&riu=http%3a%2f%2fgymkhana.iitb.ac.in%2f%7esports%2fimages%2fprofile.png&ehk=QeYO2n9hr6iOCpGjMhFFocMp3a84UVyrE1IADVb3oHA%3d&risl=&pid=ImgRaw&r=0"
                  ).image,
                ),

                Transform.translate(
                  offset: const Offset(30.0,40.0),
                  child: RoundElevatedButton(
                      size: 25.0,
                      onPressed: (){

                      },
                      child: const Icon(
                        Icons.edit_outlined,
                        size: 15,
                      )
                  ),
                ),
              ],
            ),
          ),

          const Text(
            "PROFILE"
          ),
          CustomCard(
            spreadRadius: 0.0,
            blurRadius: 0.0,
            offset: const Offset(0.0,0.0),
            child: Row(
              children: const [
                Expanded(
                  child: Icon(
                      Icons.link_off_outlined
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                      "Link account"
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
          CustomCard(
            spreadRadius: 0.0,
            blurRadius: 0.0,
            offset: const Offset(0.0,0.0),
            child: Row(
              children: const [
                Expanded(
                  child: Icon(
                      Icons.fingerprint_outlined
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                      "Bio update"
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

          const Text(
              "SECURITY"
          ),
          CustomCard(
            spreadRadius: 0.0,
            blurRadius: 0.0,
            offset: const Offset(0.0,0.0),
            child: Row(
              children: const [
                Expanded(
                  child: Icon(
                      Icons.key
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                      "Change pin"
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

          const Text(
              "APPLICATION"
          ),
          CustomCard(
            spreadRadius: 0.0,
            blurRadius: 0.0,
            offset: const Offset(0.0,0.0),
            child: Row(
              children: [
                const Expanded(
                  child: Icon(
                      Icons.language_outlined
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: Text(
                      "Switch to English"
                  ),
                ),
                Expanded(
                  child: SwitcherButton(
                      offColor: Colors.white,
                      onColor: const Color.fromRGBO(0, 220, 0, 1),
                      onChange: (val){

                      }
                  ),
                )
              ],
            ),
          ),
          CustomCard(
            spreadRadius: 0.0,
            blurRadius: 0.0,
            offset: const Offset(0.0,0.0),
            child: Row(
              children: [
                const Expanded(
                  child: Icon(
                      Icons.nightlight_outlined
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: Text(
                      "Dark mode"
                  ),
                ),
                Expanded(
                  child: SwitcherButton(
                      offColor: Colors.white,
                      onColor: const Color.fromRGBO(0, 220, 0, 1),
                      onChange: (val){

                      }
                  ),
                )
              ],
            ),
          ),
          CustomCard(
            spreadRadius: 0.0,
            blurRadius: 0.0,
            offset: const Offset(0.0,0.0),
            child: Row(
              children: const [
                Expanded(
                  child: Icon(
                      Icons.close
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                      "Unregister device"
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
        ],
      ),
    );
  }
}

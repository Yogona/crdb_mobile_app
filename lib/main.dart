import 'package:crdb_mobile_app/shared/themes.dart';
import 'package:crdb_mobile_app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'AuthScreen.dart';
import 'models/mode.dart';

void main() {
  runApp(const CRDB());
}

class CRDB extends StatefulWidget {
  const CRDB({super.key});

  @override
  State<CRDB> createState() => _CRDBState();
}

class _CRDBState extends State<CRDB> {
  String _lang = "en";

  @override
  void initState(){
    super.initState();
    Mode.langStream.add(Mode.getLocale().languageCode);
    Mode.langStream.stream.listen((lang) {
      setState(() {
        _lang = lang;
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRDB Sim Banking',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Mode.getLocale(),
      supportedLocales: const [
        Locale('en', 'UK'), // English, US
        Locale('sw', 'TZ'), // Swahili, TZ
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color.fromRGBO(200, 200, 200, 1.0),
        appBarTheme: appBarTheme,
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedBtnTheme,
        textButtonTheme: textBtnTheme,
        listTileTheme: listTileTheme,
        bottomNavigationBarTheme: bottomNavTheme,
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: const Color.fromRGBO(200, 200, 200, 1.0)
        )
      ),
      home: const Wrapper(),
    );
  }
}
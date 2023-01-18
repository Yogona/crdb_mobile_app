import 'package:flutter/material.dart';
import 'colors.dart';

const appBarTheme = AppBarTheme(
  elevation: 0.0,
  foregroundColor: Colors.black,
  backgroundColor: Colors.transparent
);

const bottomNavTheme = BottomNavigationBarThemeData(
  backgroundColor: Color.fromRGBO(64,196,255, 1.0)
);

const iconThemeData = IconThemeData(
  color: Colors.white,
  size: 10.0
);

const listTileTheme = ListTileThemeData(
  tileColor: Colors.white
);

var elevatedBtnTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor:  MaterialStateProperty.all(dominantColor),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50.0))
    )),
  )
);

var textBtnTheme = TextButtonThemeData(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all(dominantColor),
  ),
);

var defaultOutlineBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.transparent,
      width: 2.0
    )
);

var inputDecorationDarkTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.black54,
  floatingLabelStyle: const TextStyle(
      color: Colors.black
  ),
  labelStyle: TextStyle(
    color: Colors.white
  ),
  border: defaultOutlineBorder.copyWith(
    borderRadius: BorderRadius.circular(5.0),
  ),
  contentPadding: EdgeInsets.only(
      top: 0.0, bottom: 0.0, left: 10.0
  ),
  // errorBorder: defaultOutlineBorder.copyWith(
  //   borderSide: const BorderSide(
  //     color: Colors.red
  //   )
  // ),
  focusedBorder: defaultOutlineBorder.copyWith(
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),
  enabledBorder: defaultOutlineBorder,
);

var inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: const Color.fromRGBO(180, 180, 180, 1.0),
  floatingLabelStyle: const TextStyle(
    color: Colors.black
  ),
  border: defaultOutlineBorder,
  contentPadding: const EdgeInsets.only(
      top: 0.0, bottom: 0.0, left: 10.0
  ),
  // errorBorder: defaultOutlineBorder.copyWith(
  //   borderSide: const BorderSide(
  //     color: Colors.red
  //   )
  // ),
  focusedBorder: defaultOutlineBorder.copyWith(
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),
  enabledBorder: defaultOutlineBorder,
);
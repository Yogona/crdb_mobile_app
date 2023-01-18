import 'dart:async';
import 'dart:ui';
// import 'package:bank/shared/constants.dart';

class Mode{
  static StreamController<String> themeStream = StreamController<String>.broadcast();
  static StreamController<String> langStream  = StreamController<String>.broadcast();

  static Locale _locale = const Locale("en", "UK");
  static void setLocale(Locale locale){_locale = locale;}
  static Locale getLocale(){return _locale;}

  static Color _containerColor = const Color.fromARGB(170, 199, 227, 250);
  static void setContainerColor(Color color){_containerColor = color;}
  static Color getContainerColor(){return _containerColor;}

  // static String _bgImage = lightBgPath;
  // static void setBackground(String path){_bgImage = path;}
  // static String getBackground(){return _bgImage;}
}
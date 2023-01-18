import 'package:crdb_mobile_app/AuthScreen.dart';
import 'package:crdb_mobile_app/root.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isAuth = true;

  void toggleAuth(){
    setState((){
      isAuth = !isAuth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (isAuth)?AuthScreen(toggleAuth: toggleAuth,):Root(toggleAuth: toggleAuth,);
  }
}

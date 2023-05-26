import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slicing_ui/src/home_tab.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "/splash";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime()async{
    var _duration = const Duration(seconds: 3);
     return Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HomeTab.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

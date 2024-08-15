import 'dart:async';
import 'package:flutter/material.dart';
import 'package:baoim_official_app/styles/images.dart';

import 'Dashboard.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  State<SplashScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(pngLogo),
          )
      ),
    );
  }
}

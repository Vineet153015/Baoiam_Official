import 'dart:async';
import 'package:baoim_official_app/Screens/LandingScreens/StartPage1.dart';
import 'package:flutter/material.dart';
import 'package:baoim_official_app/styles/images.dart';

import 'Dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => welcomePage()));
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

import 'package:baoim_official_app/Screens/UserAuthentication/SignIn.dart';
import 'package:baoim_official_app/Firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baoim_official_app/Screens/ScreenSize.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginSuccessScreen extends StatefulWidget{
  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {


  @override
  Widget build(BuildContext context) {
    final screenSizeHelper = ScreenSizeHelper.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/loginSuccess.svg',
                      width: screenSizeHelper.blockSizeHorizontal * 100,
                      height: screenSizeHelper.blockSizeHorizontal *100,
                    ),
                    SizedBox(height: screenSizeHelper.blockSizeHorizontal*5),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>SignIn())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            screenSizeHelper.blockSizeHorizontal * 80, // 80% of screen width
                            screenSizeHelper.blockSizeVertical * 5, // 10% of screen height
                          ),
                          backgroundColor: Colors.transparent, // Set background to transparent
                          shadowColor: Colors.transparent, // Remove shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center, // Center the text
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color(0xFFFFC700),
                                Color(0xFFFF0000),
                              ],
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold, // Optional: Make the text bold
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
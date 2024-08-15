import 'dart:io';
import 'package:baoim_official_app/Screens/splash_screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:baoim_official_app/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Dashboard.dart';
import 'Screens/UserAuthentication/SignIn.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBAUd82nDrIDaS1H_nrOSOxTE-_DBZ1oCQ",
        appId: "1:881420771326:android:d144b28d7d674289a1eaaf",
        messagingSenderId: "881420771326",
        projectId: "baoiamofficial",
      ),
    );
  } else if (Platform.isIOS) {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BAOIM Official App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the future to complete, show a loading indicator
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // If there's an error, display an error message
            return const Center(child: Text('Error checking login status'));
          } else {
            // If the future completes, navigate to the appropriate screen
            bool isLoggedIn = snapshot.data ?? false;
            if (isLoggedIn) {
              return SplashScreen2();
            } else {
              return SplashScreen();
            }
          }
        },
      ),
    );
  }
}

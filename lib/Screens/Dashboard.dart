import 'package:baoim_official_app/Screens/UserAuthentication/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Dashboard extends StatelessWidget {
  // Assuming you have a FirebaseAuth instance set up
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Dashboard"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.power),
          onPressed: () async {
            // Sign out the user
            await _auth.signOut();
            // Navigate to the sign-in page
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignIn())
            );
          },
        ),
      ),
      body: Center(
        child: Text("Dashboard Content"),
      ),
    );
  }
}

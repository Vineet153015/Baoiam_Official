import 'package:flutter/material.dart';
import 'package:baoim_official_app/Screens/ScreenSize.dart';

class SignIn extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String _emailOrPhone = '';
  String _password = '';


  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Handle form submission logic (e.g., API call)

      print('Email or Phone: $_emailOrPhone');
      print('Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSizeHelper = ScreenSizeHelper.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                          height: screenSizeHelper.blockSizeHorizontal * 10),
                      Image.asset(
                        'assets/logo/baoiam_logo.png', // Replace with your logo URL
                        height: 100,
                      ),
                      SizedBox(
                          height: screenSizeHelper.blockSizeHorizontal * 10),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF010144),
                        ),
                      ),
                      SizedBox(
                          height: screenSizeHelper.blockSizeHorizontal * 10),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2), // Grey background color
                          borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none, // Remove the border
                            enabledBorder:
                            InputBorder.none, // Remove the border
                            focusedBorder:
                            InputBorder.none, // Remove the border
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ), // Adjust padding as needed
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.endsWith('@gmail.com')) {
                              return 'Email must be a valid Gmail address (@gmail.com)';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _emailOrPhone = value ?? '';
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2), // Grey background color
                          borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none, // Remove the border
                            enabledBorder:
                            InputBorder.none, // Remove the border
                            focusedBorder:
                            InputBorder.none, // Remove the border
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ), // Adjust padding as needed
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value ?? '';
                          },
                        ),
                      ),

                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Or Login with',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     IconButton(
                      //       icon: Image.network('https://your_google_icon_url_here.png'), // Replace with Google icon URL
                      //       onPressed: () {},
                      //     ),
                      //     IconButton(
                      //       icon: Image.network('https://your_apple_icon_url_here.png'), // Replace with Apple icon URL
                      //       onPressed: () {},
                      //     ),
                      //     IconButton(
                      //       icon: Image.network('https://your_facebook_icon_url_here.png'), // Replace with Facebook icon URL
                      //       onPressed: () {},
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

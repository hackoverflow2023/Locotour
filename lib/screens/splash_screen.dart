import 'dart:async';

import 'package:flutter/material.dart';
import 'package:locotour/constants.dart';
import 'package:locotour/screens/home/main_screen.dart';
import 'package:locotour/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';

  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  timer() {
    Timer(Duration(seconds: 5),
            () { 
      Navigator.pushReplacementNamed(context, LoginScreen.id);

      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height(context) * 0.3,
                        width: width(context) * 0.3,
                        // child: Image.asset('assets/images/logo.png'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
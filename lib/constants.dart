import 'package:flutter/material.dart';
import 'package:locotour/screens/login/login_screen.dart';
import 'package:locotour/screens/login/signup_screen.dart';
import 'package:locotour/screens/splash_screen.dart';

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Map<String, Widget Function(BuildContext)> routes = {
  // AddComplaint.id : (context) => AddComplaint(),
  // BinList.id : (context) => BinList(),
  // BinScreen.id : (context) => BinScreen(),
  // ComplaintDetails.id : (context) => ComplaintDetails(),
  // ComplaintList.id : (context) => ComplaintList(),
  LoginScreen.id : (context) => LoginScreen(),
  // MainScreen.id : (context) => MainScreen(),
  // NavigatePage.id : (context) => NavigatePage(),
  SignupPage.id : (context) => SignupPage(),
  SplashScreen.id : (context) => SplashScreen(),
};
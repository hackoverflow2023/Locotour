import 'package:flutter/material.dart';
import 'package:locotour/constants.dart';
import 'package:locotour/provider/authentication_provider.dart';
import 'package:locotour/screens/splash_screen.dart';
import 'package:locotour/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => LocationProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => ComplaintProvider(),
        // ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // void initializeFlutterFire() async {
  //   await Firebase.initializeApp();
  // }

  @override
  void initState() {
    super.initState();
    // initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocoTour',
      theme: theme(),
      home: const SplashScreen(),
      routes: routes,
      // builder: EasyLoading.init(),
    );
  }
}

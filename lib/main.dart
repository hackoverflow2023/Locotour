import 'package:flutter/material.dart';
import 'package:locotour/constants.dart';
import 'package:locotour/screens/splash_screen.dart';
import 'package:locotour/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(
  //         create: (_) => AuthenticationProvider(),
  //       ),
  //       ChangeNotifierProvider(
  //         create: (_) => LocationProvider(),
  //       ),
  //       ChangeNotifierProvider(
  //         create: (_) => ComplaintProvider(),
  //       ),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
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
      title: 'KudaCam',
      theme: theme(),
      home: const SplashScreen(),
      routes: routes,
      // builder: EasyLoading.init(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class NavigatePage extends StatefulWidget {
//   static const String id = 'navigate-screen';
//
//   const NavigatePage({Key? key}) : super(key: key);
//
//   @override
//   _NavigatePageState createState() => _NavigatePageState();
// }
//
// class _NavigatePageState extends State<NavigatePage> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (ctx, userSnapshot) {
//         if (userSnapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         }
//         if (userSnapshot.hasData) {
//           return const MainScreen();
//         }
//         return const LoginScreen();
//       },
//     );
//   }
// }



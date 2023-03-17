import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locotour/constants.dart';
import 'package:locotour/model/locationNavigator.dart';
import 'package:locotour/provider/location_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              height: 300,
              width: 300,
            ),
            FutureBuilder(
              future: locationProvider.getUserCurrentLocation(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const LocationNavigatePage()));
                  });

                }
                return const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

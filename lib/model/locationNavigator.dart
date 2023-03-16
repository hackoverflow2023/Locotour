import 'package:locotour/model/location_permission.dart' as lc;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:locotour/screens/home/main_screen.dart';

class LocationNavigatePage extends StatefulWidget {
  const LocationNavigatePage({Key? key}) : super(key: key);

  @override
  State<LocationNavigatePage> createState() => _LocationNavigatePageState();
}

class _LocationNavigatePageState extends State<LocationNavigatePage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Geolocator.getServiceStatusStream(),
      builder: (ctx, snapshot) {
        print("In Builder");
        if (snapshot.data == ServiceStatus.enabled) {
          print("Success");
          return const MainScreen();
        }

        if(snapshot.data == ServiceStatus.disabled) {
          return const lc.LocationPermission();
        }

        return FutureBuilder(
          future: Location.instance.serviceEnabled(),
          builder: (ctx, snap) {
            if(snap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if(snap.hasData) {
              if(snap.data == true) {
                return const MainScreen();
              }
              return const lc.LocationPermission();
            }
            return Container();
          },
        );
      },
    );
  }
}

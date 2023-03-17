import 'package:flutter/material.dart';
import 'package:locotour/screens/home/widgets/renter_appbar.dart';

class RenterDetailsScreen extends StatelessWidget {
  static const String id = 'renter-details-screen';
  const RenterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return [
        const RenterAppBar(),
      ];
    },
    body: Container(),
    ),);
  }
}

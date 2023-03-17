import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:locotour/constants.dart';
import 'package:locotour/model/google_map.dart';
import 'package:locotour/provider/location_provider.dart';
import 'package:locotour/provider/renter_provider.dart';
import 'package:locotour/screens/home/widgets/renters_list.dart';
import 'package:locotour/services/complaint_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final renterProvider = Provider.of<RenterProvider>(context);
    bool first = false;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: height(context) * 0.28,
            child: const MyGoogleMap(),
          ),
          Positioned.fill(
            child: DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.345,
              initialChildSize: 0.37,
              builder: (ctx, controller) {
                return Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.white,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: ComplaintService().renters,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        Map nearbyRenters = snapshot.data!.docs.asMap();
                        renterProvider.setRenterDetails(nearbyRenters);
                        return ListView.builder(
                          controller: controller,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            if(index == 0 || first == true) {
                              if (locationProvider.getDistance(nearbyRenters[index]["Location"]) <= 2) {
                                first = false;
                                return RentersList(
                                  index: index,
                                  isFirst: true,
                                );
                              } else {
                                first = true;
                              }
                            } else {
                              if (locationProvider.getDistance(nearbyRenters[index]["Location"]) <= 2) {
                                return RentersList(
                                  index: index,
                                  isFirst: false,
                                );
                              }
                            }
                            return Container();
                          },
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

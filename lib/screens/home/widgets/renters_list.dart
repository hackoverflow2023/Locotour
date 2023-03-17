import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locotour/provider/location_provider.dart';
import 'package:locotour/provider/renter_provider.dart';
import 'package:locotour/screens/home/sub_screens/renter_details_screen.dart';
import 'package:provider/provider.dart';

class RentersList extends StatefulWidget with ChangeNotifier {
  final int index;
  final bool isFirst;

  RentersList({Key? key, required this.index, required this.isFirst}) : super(key: key);

  @override
  _RentersListState createState() => _RentersListState();
}

class _RentersListState extends State<RentersList> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final renterProvider = Provider.of<RenterProvider>(context);

    Future<double> getDistance() async {
      double distance = Geolocator.distanceBetween(
            locationProvider.latitude,
            locationProvider.longitude,
            renterProvider.getRenterDetails()[widget.index]["Location"].latitude,
            renterProvider.getRenterDetails()[widget.index]["Location"].longitude,
          ) /
          1000;
      return double.parse(distance.toStringAsFixed(2));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isFirst
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 40,
                    color: Colors.grey[300],
                    height: 2,
                  ),
                ),
              )
            : Container(),
        widget.isFirst
            ? Container(
                padding: const EdgeInsets.only(top: 5.0, left: 10, bottom: 10),
                child: const Text(
                  "Nearby Renters",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> RenterDetailsScreen(index: widget.index)));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 8,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(renterProvider.getRenterDetails()[widget.index]["Image"]),
                  ),
                ),
                title: Text(
                  renterProvider.getRenterDetails()[widget.index]["Address"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                trailing: FutureBuilder(
                  future: getDistance(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("${snapshot.data} km");
                    }
                    return const Text("");
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

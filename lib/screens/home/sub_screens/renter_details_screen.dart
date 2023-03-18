import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:locotour/provider/renter_provider.dart';
import 'package:locotour/screens/home/sub_screens/book_order_screen.dart';
import 'package:locotour/screens/home/widgets/renter_appbar.dart';
import 'package:provider/provider.dart';

class RenterDetailsScreen extends StatelessWidget {
  static const String id = 'renter-details-screen';
  final int index;
  const RenterDetailsScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final renterProvider = Provider.of<RenterProvider>(context);
    final length = renterProvider.getRenterDetails()[index]["Photos"].length;
    final reviews = renterProvider.getRenterDetails()[index]["Reviews"];
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BookOrderScreen()));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            fixedSize:
                MaterialStateProperty.all<Size>(const Size.fromHeight(45)),
          ),
          child: const Text('Book Order'),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            RenterAppBar(index: index),
          ];
        },
        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 200,
              child: CarouselSlider(
                items: renterProvider
                    .getRenterDetails()[index]["Photos"]
                    .map<Widget>((url) {
                  return Image.network(url);
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(length, (index) {
                return Container(
                  width: 4,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Text(
              'Services Available',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: renterProvider.getRenterDetails()[index]["Services"].length,
                itemBuilder: (context, indexx) {
                  final service = renterProvider.getRenterDetails()[index]["Services"];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
                    child: Text(service[indexx]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Customer Reviews',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: CarouselSlider(
                items: reviews.map<Widget>((it) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                        NetworkImage(it["Image"]!),
                      ),
                      const SizedBox(height: 10),
                      Text(it["Name"]!),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Text(
                          it["Note"]!,
                          textAlign: TextAlign.justify,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                }).toList(),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

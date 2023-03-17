import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:locotour/screens/home/widgets/renter_appbar.dart';

class RenterDetailsScreen extends StatelessWidget {
  static const String id = 'renter-details-screen';
  final int index;
  const RenterDetailsScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
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
                items: [
                  Image.network(
                      'https://imgd.aeplcdn.com/1056x594/n/cw/ec/102709/ntorq-125-right-front-three-quarter.jpeg?isig=0&q=75'),
                  Image.network(
                      'https://cdn.pixabay.com/photo/2015/10/30/20/13/sunrise-1014712__340.jpg'),
                  Image.network(
                      'https://cdn.pixabay.com/photo/2016/11/21/14/52/beach-1845810__340.jpg'),
                ],
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
              children: [
                Container(
                  width: 4,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 4,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 4,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Expanded(
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream: firestore.collection('services').snapshots(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(child: CircularProgressIndicator());
            //       }
            //       final services = snapshot.data.docs;
            //       return ListView.builder(
            //         itemCount: services.length,
            //         itemBuilder: (context, index) {
            //           final service = services[index];
            //           return ListTile(
            //             title: Text(service['name']),
            //             subtitle: Text(service['description']),
            //             trailing: Text('\$${service['price']}'),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(height: 20),
            Text(
              'Customer Reviews',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.amber,
              height: 150,
              child: CarouselSlider(
                items: [
                  Column(
                    children: const [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://example.com/avatar1.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text('John Doe'),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://example.com/avatar1.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text('John Doe'),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://example.com/avatar1.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text('John Doe'),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.95,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

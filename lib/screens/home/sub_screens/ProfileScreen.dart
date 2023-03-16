import 'package:flutter/material.dart';
import 'package:locotour/Modules/Data.dart';
import 'package:locotour/Modules/Events.dart';
import 'package:locotour/screens/home/widgets/ProfileEventContainer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    padding: const EdgeInsets.all(30),
                    color: Colors.black,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            'assets/pp.jpg',
                          ),
                        ),
                        const SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Marwan Pablo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: const [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  'Alexandria, Egypt',
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    bottom: 20,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Text(
                          'Upcoming',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selected == 0 ? Colors.black : Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selected = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Text(
                          'Visited',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selected == 1 ? Colors.black : Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selected = 1;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Text(
                          'Saved',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selected == 2 ? Colors.black : Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selected = 2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: profileEvents.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Event event = profileEvents[index];
                  return ProfileEventContainer(
                    event: event, key: null,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
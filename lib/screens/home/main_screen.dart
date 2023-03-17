import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locotour/screens/home/sub_screens/ProfilePage.dart';
import 'package:locotour/screens/home/sub_screens/community_screen.dart';
import 'package:locotour/screens/home/sub_screens/eventPage.dart';
import 'package:locotour/screens/home/sub_screens/home_screen.dart';
import 'package:locotour/screens/home/widgets/my_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  // to keep track of active tab index
  final List<Widget> screens = [
    const HomeScreen(),
    CommunityScreen(),
    EventScreen(),
    const ProfilePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          children: <Widget>[
            _bottomNavIcon(
              const HomeScreen(),
              0,
              CupertinoIcons.home,
              'Home',
            ),
            _bottomNavIcon(
              CommunityScreen(),
              1,
              Icons.people_alt_outlined,
              'Community',
            ),
            _bottomNavIcon(
              EventScreen(),
              2,
              Icons.event_outlined,
              'Bookings',
            ),
            _bottomNavIcon(
              const ProfilePage(),
              3,
              CupertinoIcons.profile_circled,
              'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavIcon(
      Widget navWidget, int currentTabIndex, IconData icon, String title) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          setState(() {
            currentScreen = navWidget;
            currentTab = currentTabIndex;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: currentTab == currentTabIndex ? Colors.orange : Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color:
                      currentTab == currentTabIndex ? Colors.orange : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

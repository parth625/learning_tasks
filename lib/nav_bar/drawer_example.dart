import 'package:demo_app/nav_bar/carousal_slider_example.dart';
import 'package:demo_app/nav_bar/bottom_navigation_example.dart';
import 'package:demo_app/nav_bar/bottom_sheet_example.dart';
import 'package:demo_app/nav_bar/page_view_example.dart';
import 'package:demo_app/nav_bar/pages/home_page.dart';
import 'package:demo_app/nav_bar/pages/profile_page.dart';
import 'package:demo_app/nav_bar/pages/settings_page.dart';
import 'package:demo_app/nav_bar/tab_bar_example.dart';
import 'package:flutter/material.dart';

class DrawerExample extends StatelessWidget {
  const DrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer Example')),
      body: Center(child: Text('Drawer')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                accountName: Text("Parth Rathod"),
                accountEmail: Text("parth@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                margin: EdgeInsets.all(0),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text('P', style: TextStyle(fontSize: 30)),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.navigate_next),
              title: Text('Bottom Navigation bar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationExample(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.navigate_next_outlined),
              title: Text('Tab Bar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBarExample()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.arrow_circle_up_outlined),
              title: Text('Model Bottom Sheet'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomSheetExample()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.pageview),
              title: Text('PageView'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageViewExample()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.slideshow_rounded),
              title: Text('Carousal slider'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarousalSliderExample()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

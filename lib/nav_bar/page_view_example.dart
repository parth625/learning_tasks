import 'package:demo_app/nav_bar/pages/home_page.dart';
import 'package:demo_app/nav_bar/pages/profile_page.dart';
import 'package:demo_app/nav_bar/pages/settings_page.dart';
import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  PageController pageController = PageController();

  int currentPage = 0;

  List<Widget> pages = [HomePage(), ProfilePage(), SettingsPage()];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
            pageController.jumpToPage(currentPage);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:demo_app/nav_bar/pages/home_page.dart';
import 'package:demo_app/nav_bar/pages/profile_page.dart';
import 'package:demo_app/nav_bar/pages/settings_page.dart';
import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      log(_controller.index.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar Example'),
        bottom: TabBar(
          controller: _controller,

          onTap: (value) {
            _controller.animateTo(_selectedIndex);
          },
          tabs: [
            Text('Tab 1', style: TextStyle(fontSize: 18)),
            Text('Tab 2', style: TextStyle(fontSize: 18)),
            Text('Tab 3', style: TextStyle(fontSize: 18)),
          ],
          dividerHeight: 0,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [HomePage(), ProfilePage(), SettingsPage()],
      ),
    );
  }
}

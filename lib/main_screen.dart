import 'package:demo_app/day1/widgets/stateless_widgets.dart';
import 'package:demo_app/day2/counter_app.dart';
import 'package:demo_app/day3/user_form.dart';
import 'package:demo_app/day4/list_builder.dart';
import 'package:demo_app/day5/life_cycle.dart';
import 'package:demo_app/day6/calculator.dart';
import 'package:demo_app/day9/pass_data/screen1.dart';
import 'package:demo_app/nav_bar/drawer_example.dart';
import 'package:demo_app/nav_bar/tab_bar_example.dart';
import 'package:flutter/material.dart';

import 'day7/screen_one.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Scaffold(
        appBar: AppBar(title: Text('Main Screen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonTile(context, "Day 1", StlExample()),
              buttonTile(context, "Day 2", CounterApp()),
              buttonTile(context, "Day 3", UserForm()),
              buttonTile(context, "Day 4", ListBuilder()),
              buttonTile(context, "Day 5", LifeCycle()),
              buttonTile(context, "Day 6", Calculator()),
              buttonTile(context, "Day 7", ScreenOne()),
              buttonTileNamed(context, "Day 8", '/first'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  buttonTile(context, "Day 9 - 1", Screen1()),
                  buttonTile(context, "Day 9 - 2", TabBarExample()),
                ],
              ),
              buttonTile(context, "Extra", DrawerExample()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonTile(BuildContext context, String day, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        textStyle: TextStyle(fontSize: 20, color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Text(day),
    );
  }

  Widget buttonTileNamed(BuildContext context, String day, String route) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        textStyle: TextStyle(fontSize: 20, color: Colors.black),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(day),
    );
  }
}

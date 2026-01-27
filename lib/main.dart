import 'package:demo_app/day7/screen_four.dart';
import 'package:demo_app/day7/screen_one.dart';
import 'package:demo_app/day7/screen_three.dart';
import 'package:demo_app/day7/screen_two.dart';
import 'package:demo_app/day8/first.dart';
import 'package:demo_app/day8/third.dart';
import 'package:demo_app/firebase_options.dart';
import 'package:demo_app/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'day8/second.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/screen1': (context) => ScreenOne(),
        '/screen2': (context) => ScreenTwo(),
        '/screen3': (context) => ScreenThree(),
        '/screen4': (context) => ScreenFour(),
        '/first': (context) => First(),
        '/second': (context) => Second(),
        '/third': (context) => Third(),
        // '/day6': (context) => ScreenTwo()
      },
    );
  }
}

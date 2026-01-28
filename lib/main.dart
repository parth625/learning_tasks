import 'package:demo_app/day11_provider/list_map_provider.dart';
import 'package:demo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'day11_provider/counter_provider.dart';
import 'day11_provider/list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: DemoApp(),
    ),
  );
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),

      home: ListPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MainScreen(),
      //   '/screen1': (context) => ScreenOne(),
      //   '/screen2': (context) => ScreenTwo(),
      //   '/screen3': (context) => ScreenThree(),
      //   '/screen4': (context) => ScreenFour(),
      //   '/first': (context) => First(),
      //   '/second': (context) => Second(),
      //   '/third': (context) => Third(),
      // '/day6': (context) => ScreenTwo()
      // },
    );
  }
}

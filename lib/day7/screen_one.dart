import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(("Screen One"))),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pushNamed(context, "/day6");
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenTwo()));
          },
          child: Text('Go to Next Screen'),
        ),
      ),
    );
  }
}

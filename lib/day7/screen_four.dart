import 'package:flutter/material.dart';

class ScreenFour extends StatelessWidget {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fourth Screen'), ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('Go Back')),

      ),
    );
  }
}

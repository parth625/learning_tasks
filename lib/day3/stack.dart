import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.grey,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.black,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }
}

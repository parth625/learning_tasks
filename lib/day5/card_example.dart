import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card')),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 400,

          child: Card(
            elevation: 50,
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}

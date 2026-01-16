import 'package:flutter/material.dart';

class StatefulExample extends StatefulWidget{
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => StatefulExampleState();
}

class StatefulExampleState extends State<StatefulExample>{
  @override
  Widget build(BuildContext context) {

    var count = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('CounterApp'),

      ),
      body: Column(
        children: [
          Text('Count: $count', style: TextStyle(
            fontSize: 20,
          ),)
        ],
      ),

    );
  }
}
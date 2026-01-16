import 'package:flutter/material.dart';

class StlExample extends StatelessWidget{
  const StlExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget'),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Center(child: Text('Stateless Widget', style: TextStyle(color: Colors.white, fontSize: 20),)),
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Count: $count', style: TextStyle(fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [

                ElevatedButton(onPressed: (){
                  setState(() {
                    count++;
                  });
                }, child: Text('+')),
                ElevatedButton(onPressed: (){
                  setState(() {
                    count--;
                  });
                }, child: Text('-')),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}

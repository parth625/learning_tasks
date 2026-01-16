import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenThree()));
                Navigator.pushNamed(context, '/screen3');
              },
              child: Text('Go to Screen 1'),
            ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/screen3');
    }, child: Text('Go to Screen 3'))
          //   ElevatedButton(onPressed: (){
          //     Navigator.pop(context);
          //   }, child: Text('Go back to Screen 1'))
          ],
        ),
      ),
    );
  }
}

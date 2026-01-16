import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(context, '/screen4', (route) => route.settings.name == '/screen1',);
                Navigator.pushNamed(context, '/screen1');
              },
              child: Text('Go to Screen 1'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/screen2');
            }, child: Text('Go to Screen 2'))
          ],
        ),
      ),
    );
  }
}

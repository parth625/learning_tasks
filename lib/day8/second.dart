import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({super.key});

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
                // Navigator.pushNamedAndRemoveUntil(context, '/screen4', (route) => route.settings.name == '/screen1',);
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Back'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/third');
            }, child: Text('Go to Screen 3'))
          ],
        ),
      ),
    );
  }
}

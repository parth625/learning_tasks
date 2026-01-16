import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenThree()));
                Navigator.pushReplacementNamed(context, '/second');
              },
              child: Text('Back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  // '/first',
                  (route) => route.isFirst,
                );
              },
              child: Text('Go to Screen 1'),
            ),
            //   ElevatedButton(onPressed: (){
            //     Navigator.pop(context);
            //   }, child: Text('Go back to Screen 1'))
          ],
        ),
      ),
    );
  }
}

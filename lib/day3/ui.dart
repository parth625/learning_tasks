import 'package:flutter/material.dart';

class UI extends StatelessWidget {
  const UI({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //         height: 200,
    //         color: Colors.red,
    //       ),
    //       Expanded(child: Container(color: Colors.grey,)),
    //       Container(
    //         height: 100,
    //         color: Colors.blue,
    //       ),
    //     ],
    //   ),
    // );

    return Scaffold(
      body: SizedBox(
        height: 200,
        child:
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 2,
              child: Container(

                color: Colors.grey,
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(

                color: Colors.grey,
              ),
            )

          ],
        ),
      ),
    );
  }
}

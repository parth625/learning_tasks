
import 'package:flutter/material.dart';

class ContainerEx extends StatefulWidget {
  const ContainerEx({super.key});

  @override
  State<ContainerEx> createState() => _ContainerExState();
}

class _ContainerExState extends State<ContainerEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(0, 5),
            
                  )
                ]
              ),
              child: Icon(Icons.downhill_skiing, size: 40,),
            ),
            Image.asset('assets/images/row.png'),
            // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', fit: BoxFit.cover, height: 200, width: 200,)
          ],
        ),
      ),
    );
  }
}

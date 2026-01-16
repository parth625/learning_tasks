import 'package:flutter/material.dart';

class PointersExample extends StatelessWidget {
  const PointersExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pointers')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Ignore Pointer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            _ignorePointerEx(context),
            Text("Absorb Pointer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            _absorbPointerEx(context),
          ],
        ),
      ),
    );
  }
}

Widget _absorbPointerEx(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: AlignmentGeometry.center,
      children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Red tapped"),
                backgroundColor: Colors.red,
                duration: Duration(milliseconds: 500),
              ),
            );
          },
          child: Container(height: 300, width: 300, color: Colors.red),
        ),
        AbsorbPointer(
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(

                  content: Text("Green tapped"),
                  backgroundColor: Colors.green,
                  duration: Duration(milliseconds: 500),
                ),
              );
            },
            child: Container(height: 150, width: 150, color: Colors.green),
          ),
        ),
      ],
    ),
  );
}

Widget _ignorePointerEx(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: AlignmentGeometry.center,
      children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Red tapped"),
                backgroundColor: Colors.red,
                duration: Duration(milliseconds: 500),
              ),
            );
          },
          child: Container(height: 300, width: 300, color: Colors.red),
        ),
        IgnorePointer(
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(

                  content: Text("Green tapped"),
                  backgroundColor: Colors.green,
                  duration: Duration(milliseconds: 500),
                ),
              );
            },
            child: Container(height: 150, width: 150, color: Colors.green),
          ),
        ),
      ],
    ),
  );
}
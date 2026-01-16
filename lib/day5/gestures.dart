import 'package:flutter/material.dart';

class Gestures extends StatefulWidget {
  const Gestures({super.key});

  @override
  State<Gestures> createState() => _GesturesState();
}

class _GesturesState extends State<Gestures> {
  Color bgColor = Colors.blue;
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Tapped"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              onDoubleTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Double Tapped")));
              },
              onPanUpdate: (details) {
                if (details.delta.dx < 0) {
                  setState(() {
                    bgColor = Colors.red;
                  });
                } else if (details.delta.dx > 0) {
                  setState(() {
                    bgColor = Colors.green;
                  });
                }
                if (details.delta.dy < 0) {
                  setState(() {
                    bgColor = Colors.orangeAccent;
                  });
                } else if (details.delta.dy > 0) {
                  setState(() {
                    bgColor = Colors.blueAccent;
                  });
                }
              },
              child: Container(
                height: 200,
                width: 200,

                color: bgColor,
                child: Center(
                  child: Text(
                    'Swipe',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Tapped")));
                },
                child: Center(child: Text('Tap')),
              ),
            ),

            Switch(
              value: isOn,
              onChanged: (value) {
                setState(() {
                  isOn = !isOn;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

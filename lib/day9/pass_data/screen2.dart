import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key, required this.data});

  final List data;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 25, color: Colors.black),
                children: [
                  TextSpan(text: "TextField1: "),
                  TextSpan(
                    text: "${widget.data[0]}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 25, color: Colors.black),
                children: [
                  TextSpan(text: "TextField2: "),
                  TextSpan(
                    text: "${widget.data[1]}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hint: Text('Enter data2'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            MaterialButton(
              color: Colors.purple[400],
              onPressed: () {
                Navigator.pop(context, textEditingController.text);
              },
              child: Text('Send data to Screen 1'),
            ),
          ],
        ),
      ),
    );
  }
}

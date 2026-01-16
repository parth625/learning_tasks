import 'dart:developer';

import 'package:demo_app/day9/pass_data/screen2.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  List? data;
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pass data')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: textEditingController1,
                decoration: InputDecoration(
                  hint: Text('Enter data1'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              TextField(
                controller: textEditingController2,
                decoration: InputDecoration(
                  hint: Text('Enter data2'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                   result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(
                        data: [
                          textEditingController1.text,
                          textEditingController2.text,
                        ],
                      ),
                    ),
                  );

                   if(result != null){
                     log('Data from Second screen: $result');
                   }
                },
                color: Colors.blue,
                child: Text('Send Data'),
              ),
              // if(result != null)
              //   Text(result ?? "no data"),
              Visibility(
                visible: result != null,
                child:
                Text(result ?? "no data"), ),
            ],
          ),
        ),
      ),
    );
  }
}

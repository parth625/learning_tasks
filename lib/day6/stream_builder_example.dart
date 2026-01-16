import 'dart:async';
import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  // Continuous Number Stream
  Stream<int> numberStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  StreamController<String> streamController = StreamController();
  TextEditingController textController = TextEditingController();

  //For Creating Broadcast stream
  late Stream dataStream;

  @override
  void initState() {
    //For Creating Broadcast Stream
    dataStream = streamController.stream.asBroadcastStream();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Streambuilder Example')),
      body: numberStreamEx(),
    );
  }

  Widget numberStreamEx() {
    return Center(
      child: StreamBuilder(
        stream: numberStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return Text(
            "Data: ${snapshot.data}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          );
        },
      ),
    );
  }

  Widget broadCastStreamEx() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: dataStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return Text('Error: ${snapshot.error}');
              }
            },
          ),
          StreamBuilder(
            stream: dataStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return Text('Error: ${snapshot.error}');
              }
            },
          ),

          TextField(controller: textController),
          ElevatedButton(
            onPressed: () {
              streamController.add(textController.text);
            },
            child: Text('Get'),
          ),
        ],
      ),
    );
  }

  Widget singleStreamEx() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return Text('Error: ${snapshot.error}');
              }
            },
          ),

          TextField(controller: textController),
          ElevatedButton(
            onPressed: () {
              streamController.add(textController.text);
            },
            child: Text('Get'),
          ),
        ],
      ),
    );
  }
}

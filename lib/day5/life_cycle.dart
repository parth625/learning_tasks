import 'dart:developer';
import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  const LifeCycle({super.key});

  @override
  State<StatefulWidget> createState() {
    // log('Create State');
    return LifeCycleState();
  }
}

class LifeCycleState extends State<LifeCycle> {
  int count = 0;
  int tempCount = 0;

  @override
  void initState() {
    count = 0;
    log("InitState, Count: $count");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log("DidChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LifeCycle oldWidget) {
    log("DidUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    log('Dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    log("Deactivate");
    super.deactivate();
  }

  void addTempCount(){
    tempCount++;
  }
  @override
  Widget build(BuildContext context) {
    log("Inside Build");
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text('Counter: $count')),
          Divider(color: Colors.black,),
          StatefulBuilder(builder: (context, setState) {
            return Column(
              children: [
                Text("TempCount : $tempCount"),
                ElevatedButton(onPressed: (){
                  setState((){
                    addTempCount();
                  });
                  }, child: Text("+"))
              ],
            );
          },),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
            log('SetState, Count: $count');
          });
        },
        child: Text('+'),
      ),
    );
  }
}

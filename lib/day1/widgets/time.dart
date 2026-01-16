import 'package:flutter/material.dart';

class TimePickerExample extends StatefulWidget {
  const TimePickerExample({super.key});

  @override
  State<TimePickerExample> createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  TimeOfDay? time, picked;

  @override
  void initState() {
    time = TimeOfDay.now();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Picker Example')),
      body: Center(
        child: Column(
          children: [
            Text(
              'Time: ${time?.format(context).toString()}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                time =  await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(()  {
                  picked = time;
                });
              },
              child: Text('Select Time'),
            ),
          ],
        ),
      ),
    );
  }
}

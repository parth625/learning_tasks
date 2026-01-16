import 'package:flutter/material.dart';

class ListViewEx extends StatelessWidget {
  const ListViewEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Day 4')),
      body: ListView(
        children: List.generate(10, (index) {
          return createListTile(index+1);
        },),
      ),
    );
  }

  Widget createListTile(int index) {
    List<String> words = [
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
    ];

    return ListTile(title: Text(words[index - 1]));
  }
}

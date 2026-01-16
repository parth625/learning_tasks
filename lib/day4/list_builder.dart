import 'package:flutter/material.dart';

class ListBuilder extends StatelessWidget {
  const ListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Builder')),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 10,
        itemBuilder: (context, index) {
          return createListTile(index);
        },
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

    return Row(
      spacing: 15,
      children: List.generate(5, (ind) {
        return Text(
          words[index],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        );
      }),
    );
  }
}

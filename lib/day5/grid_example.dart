import 'package:flutter/material.dart';

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView')),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.grey.shade400,
            ),
          );
        }),
      ),
    );
  }

  Widget gridBuilder() {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 100, width: 100, color: Colors.grey),
        );
      },
    );
  }

  Widget gridView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: List.generate(20, (index) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.greenAccent,
            child: Text('$index'),
          ),
        );
      }),
    );
  }
}

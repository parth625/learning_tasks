import 'package:flutter/material.dart';

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Tile Example'),
        elevation: 0,
      ),
      body: ListView.builder(

        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ListTile(
              onTap: (){},
              leading: Icon(Icons.person),
              title: Text('ListTiles ${index+1}'),
              tileColor: Colors.grey,
              trailing: Icon(Icons.add),
              contentPadding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          );
        },
      ),
    );
  }
}

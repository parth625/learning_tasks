import 'package:demo_app/day11_provider/add_item_page.dart';
import 'package:demo_app/day11_provider/list_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List')),
      body: Consumer<ListMapProvider>(
        builder: (_, provider, _) {
          var allData = provider.getData();

          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${allData[index]['name']}'),
                      subtitle: Text('${allData[index]['mobile']}'),
                    );
                  },
                )
              : Center(child: Text('No items added yet.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddItemPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

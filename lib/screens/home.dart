import 'package:flutter/material.dart';
import 'package:lab3/components/item_tile.dart';
import 'package:lab3/data.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("App Store")),
        backgroundColor: Colors.yellow,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
              icon: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: storeItems.length,
            itemBuilder: (context, index) {
              return ItemTile(
                item: storeItems.elementAt(index),
              );
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lab3/data.dart';
import 'package:lab3/providers/cart_providers.dart';
import 'package:provider/provider.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Set<Item> items = Provider.of<CardProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cart")),
        backgroundColor: Colors.yellow,
        leading: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Column(children: [
        Flexible(
          flex: 8,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Item item = items.elementAt(index);
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<CardProvider>(context, listen: false)
                          .removeItem(item);
                    },
                  ),
                );
              }),
        ),
        Flexible(
          flex: 3,
          child: Text(
            Provider.of<CardProvider>(context, listen: false).total.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lab3/data.dart';
import 'package:lab3/providers/cart_providers.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool cartAddToCart = Provider.of<CardProvider>(context).isItemAdded(item);
    return Card(
      elevation: 3,
      child: Column(children: [
        Expanded(
          child: Image.network(
            item.image,
          ),
        ),
        Text(
          item.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          '${item.price}',
          style: Theme.of(context).textTheme.caption,
        ),
        IconButton(
            onPressed: cartAddToCart
                ? null
                : () {
                    Provider.of<CardProvider>(context, listen: false)
                        .addItem(item);
                  },
            icon: Icon(Icons.add_shopping_cart))
      ]),
    );
  }
}

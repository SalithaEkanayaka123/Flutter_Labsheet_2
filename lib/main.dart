import 'package:flutter/material.dart';
import 'package:lab3/screens/cart.dart';
import 'package:lab3/screens/home.dart';
import 'package:provider/provider.dart';

import 'providers/cart_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: ,
        home: home(),
        routes: <String, WidgetBuilder>{
          '/cart': (context) => cart(),
          '/home': (context) => home(),
        },
      ),
    );
  }
}

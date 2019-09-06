import 'package:flutter/material.dart';
import 'package:social_app/data/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}

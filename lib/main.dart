import 'package:flutter/material.dart';
import 'package:social_app/ui/home/Home.dart';
import 'package:social_app/ui/notifications/Notifications.dart';

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
      home: Home(),
      routes: {
        '/notifications': (_) => Notifications()
      },
    );
  }
}

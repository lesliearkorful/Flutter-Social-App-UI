import 'package:flutter/material.dart';
import '../../global-widgets/header.dart';
import 'home-widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[

          Header( screen: ScreenType.feed ),

          Panels(),

          Categories(),

          MediaList( type: MediaType.photo ),

          MediaList( type: MediaType.video )
        ],
      ),
    );
  }
}
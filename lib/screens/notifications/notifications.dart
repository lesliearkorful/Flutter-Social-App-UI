import 'package:flutter/material.dart';
import 'package:social_app/data/global.dart';
import 'package:social_app/data/notifications.dart';
import 'package:social_app/global-widgets/pill.dart';
import '../../global-widgets/header.dart';
import 'notifications-widgets.dart';


class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[

          Header(
            screen: ScreenType.notifications,
            badge: Pill(
              text: '${notificationsData.length}',
              color: UIColors.yellowOrange,
              selected: true,
            ),
          ),

          SearchWidget(),

          Time(),

          Notifications()

        ],
      ),
    );
  }
}
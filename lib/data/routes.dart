import 'package:flutter/material.dart';
import 'package:social_app/screens/home/home.dart';
import 'package:social_app/screens/notifications/notifications.dart';

final routes = {
  '/notifications' : (BuildContext context) => NotificationsPage(),
  '/' : (BuildContext context) => HomePage(),
};
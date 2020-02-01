import 'package:flutter/material.dart';

import 'Colors.dart';

const double padding = 30;

Widget badge(int count) {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
    decoration: BoxDecoration(
      color: Colors.orange.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      count.toString(),
      style: TextStyle(
        color: UIColors.yellowOrange,
        fontSize: 20,
      ),
    ),
  );
}

class PageScaffold extends StatelessWidget {
  final bool home;
  final String title;
  final String subtitle;
  final Widget badge;
  final List<Widget> children;
  final Color backgroundColor;

  PageScaffold({
    this.home = false,
    @required this.title,
    this.subtitle,
    this.badge,
    this.children = const <Widget>[],
    this.backgroundColor,
  });

  final Column menuIcon = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(color: Colors.black, height: 2.5, width: 14),
      SizedBox(height: 5),
      Container(color: Colors.black, height: 2.5, width: 24)
    ],
  );

  void navigate(context, bool home) {
    if (home)
      Navigator.pushNamed(context, '/notifications');
    else
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(padding, 30, padding, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () => navigate(context, home),
                    child: home
                        ? menuIcon
                        : Icon(
                            Icons.chevron_left,
                            color: UIColors.navyBlue,
                            size: 30,
                          ),
                  ),
                  InkWell(
                    onTap: () => navigate(context, home),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'images/avatars/les.jpg',
                        width: 34,
                        height: 34,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 38,
                            color: UIColors.navyBlue,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(width: 20),
                        badge ?? SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  if (subtitle != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ...children,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

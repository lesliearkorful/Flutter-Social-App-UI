import 'package:flutter/material.dart';
import 'package:social_app/util/Colors.dart';
import 'package:social_app/util/common.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final filters = ["Today", "Last Week"];
  String currentFilter = "Today";

  final images = [
    'images/posts/3.jpg',
    'images/posts/5.jpg',
    'images/posts/1.jpg',
    'images/posts/4.jpg',
  ];

  Widget item({String image}) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(image, height: 70, width: 70, fit: BoxFit.cover),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Jenny Smith commented on your post: "Brilliant! :)"',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text('2 hours ago', style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
        SizedBox(width: 40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: PageScaffold(
        backgroundColor: Colors.white,
        title: 'Notifications',
        badge: badge(12),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(padding),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: UIColors.grey,
                contentPadding: EdgeInsets.all(20),
                prefixIcon: Icon(
                  Icons.search,
                  color: UIColors.navyBlue,
                  size: 26,
                ),
                hintText: 'Search for name',
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.fromLTRB(padding, 15, padding, 20),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (_, __) => SizedBox(width: 40),
              itemBuilder: (context, index) {
                final filter = filters[index];
                bool active = currentFilter == filter;
                return Text(
                  filter.toUpperCase(),
                  style: TextStyle(
                    color: active ? UIColors.navyBlue : Colors.grey.shade400,
                    fontSize: 18,
                    letterSpacing: 0.4,
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(42, 50, 42, 42),
            decoration: BoxDecoration(
              color: UIColors.cardBackground,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              separatorBuilder: (_, __) => SizedBox(height: 46),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return item(image: images[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

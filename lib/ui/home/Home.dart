import 'package:flutter/material.dart';
import 'package:social_app/ui/home/HomePanel.dart';
import 'package:social_app/util/Colors.dart';
import 'package:social_app/util/common.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selected = 'Chat';
  final filters = [
    "Chat",
    "Featured",
    "Popular",
    "Following",
  ];

  final images = [
    null,
    "images/posts/4.jpg",
    "images/posts/2.jpg",
    "images/posts/3.jpg",
    "images/posts/1.jpg",
    "images/posts/5.jpg",
  ];

  Widget sectionHeader(String text) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: Text(
        text,
        style: TextStyle(
          color: UIColors.navyBlue,
          fontWeight: FontWeight.w600,
          fontSize: 22,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget imageThumbnail({String image}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: UIColors.grey,
          borderRadius: BorderRadius.circular(18),
          image: image != null
              ? DecorationImage(fit: BoxFit.cover, image: AssetImage(image))
              : null,
        ),
        child: image == null
            ? Icon(Icons.add, size: 45, color: Colors.grey.withOpacity(0.35))
            : null,
      ),
    );
  }

  Widget videoThumbnail({String image}) {
    return Container(
      width: 270,
      padding: EdgeInsets.all(14),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: Color(0xFFf7f7f7),
        borderRadius: BorderRadius.circular(18),
        image: image != null
            ? DecorationImage(fit: BoxFit.cover, image: AssetImage(image))
            : null,
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black38,
              blurRadius: 10,
            )
          ],
        ),
        child: Icon(Icons.play_arrow, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      home: true,
      title: 'Feed',
      subtitle: 'Sed ut amnet dolor',
      backgroundColor: Colors.white,
      children: <Widget>[
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            children: <Widget>[
              Expanded(
                child: HomePanel(
                  label: 'photos',
                  color: UIColors.yellowOrange,
                  count: 24,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HomePanel(
                  label: 'articles',
                  color: UIColors.softRed,
                  count: 48,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HomePanel(
                  label: 'followers',
                  color: UIColors.softPurple,
                  count: 22,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: padding),
            separatorBuilder: (_, __) => SizedBox(width: padding),
            itemCount: filters.length,
            itemBuilder: (context, index) {
              final option = filters[index];
              bool active = option == selected;
              final textColor =
                  active ? UIColors.yellowOrange : Colors.grey.shade500;
              final fontWeight = active ? FontWeight.bold : FontWeight.normal;
              return FilterChip(
                elevation: 0,
                selected: active,
                pressElevation: 0,
                showCheckmark: false,
                backgroundColor: Colors.white,
                selectedColor: Colors.orange.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onSelected: (s) {
                  setState(() => selected = option);
                },
                label: Text(
                  option.toUpperCase(),
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: fontWeight,
                    letterSpacing: 0.3,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        sectionHeader("My photos"),
        SizedBox(height: 20),
        Container(
          height: 110,
          child: ListView.separated(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: padding),
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              return imageThumbnail(image: images[index]);
            },
          ),
        ),
        SizedBox(height: 40),
        sectionHeader("My videos"),
        SizedBox(height: 20),
        Container(
          height: 145,
          child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: padding),
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final list = images.reversed.toList();
              return videoThumbnail(image: list[index]);
            },
          ),
        ),
      ],
    );
  }
}

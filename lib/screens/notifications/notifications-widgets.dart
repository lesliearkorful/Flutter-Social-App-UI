import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/data/global.dart';
import 'package:social_app/data/notifications.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.035),
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, size: 32, color: UIColors.navyBlue ),
          border: InputBorder.none,
          hintText: 'Search for name',
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.4))
        ),
      ),
    );
  }
}


enum TimeCategory {
  today,
  last_week,
}


class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  final Map<TimeCategory, String> times = {
    TimeCategory.today: 'Today',
    TimeCategory.last_week: 'Last Week',
  };

  TimeCategory selected = TimeCategory.today;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 50, horizontalPadding, 20),
      child: Row(
        children: TimeCategory.values.map((category) {

          final bool isSelected = (category == selected);

          return Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(times[category].toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected ? UIColors.navyBlue : Colors.black26
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}



class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(horizontalPadding),
      decoration: BoxDecoration(
        color: UIColors.cardBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      child: Column(
        children: notificationsData.map((item) {

          final String text = '${item.user} commented on your post: ${item.comment}';

          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(item.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                ),
                
                SizedBox(width: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    
                    Container(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text(text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 20,
                        )
                      )
                    ),

                    Text(item.time,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16
                      ),
                    ),

                  ],
                )
              ],
            ),
          );
          }).toList()
      ),
    );
  }
}
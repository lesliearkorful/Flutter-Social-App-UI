import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as iOS;
import 'package:social_app/global-widgets/pill.dart';
import '../data/global.dart';


enum ScreenType {
  feed,
  notifications
}

class Header extends StatelessWidget {
  final ScreenType screen;
  final Pill badge;

  Header({ @required this.screen, this.badge });

  final Map<ScreenType, String> screenName = {
    ScreenType.feed : 'Feed',
    ScreenType.notifications : 'Notifications'
  };

  final Column menuIcon = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        color: Colors.black,
        height: 3,
        width: 14,
      ),
      SizedBox ( height: 6),
      Container(
        color: Colors.black,
        height: 3,
        width: 28,
      )
    ],
  );
  
  @override
  Widget build(BuildContext context) {

    final bool atHome = (screen == ScreenType.feed);

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 40, horizontalPadding, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              InkWell(
                child: atHome
                        ? menuIcon
                        : iOS.CupertinoNavigationBarBackButton(
                          color: UIColors.navyBlue,
                        ),
                onTap: () {
                  atHome
                  ? Navigator.pushNamed(context, '/notifications')
                  : Navigator.pop(context);
                },
              ),

              InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('images/avatars/les.jpg',
                    width: 40,
                    height: 40
                  ),
                ),
                onTap: () {
                  atHome
                  ? Navigator.pushNamed(context, '/notifications')
                  : Navigator.pop(context);
                },
              ),

            ]
          ),

          SizedBox( height: 30 ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${screenName[screen]}',
                style: TextStyle(
                  fontSize: 32,
                  color: UIColors.navyBlue,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox( width: 10 ),

              badge ?? Container()
            ]
          ),


        ]
      )
    );
  }
}
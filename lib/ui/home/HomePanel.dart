import 'package:flutter/material.dart';
import 'package:social_app/util/Colors.dart';

class HomePanel extends StatefulWidget {
  final String label;
  final Color color;
  final int count;
  HomePanel({@required this.label, @required this.count, @required this.color});

  @override
  _HomePanelState createState() => _HomePanelState();
}

class _HomePanelState extends State<HomePanel> {
  bool active = false;

  Color get textColor {
    if (active) return Colors.white;
    return widget.color;
  }

  Color get panelColor {
    if (active) return widget.color;
    return Colors.black.withOpacity(0.04);
  }

  BoxShadow get shadow {
    if (active)
      return BoxShadow(
        offset: Offset(0, 7),
        blurRadius: 10,
        color: widget.color.withOpacity(0.3),
      );
    return BoxShadow(color: Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => active = !active),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [shadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.count.toString(),
              style: TextStyle(
                color: textColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              widget.label,
              style: TextStyle(
                color: active ? Colors.white : UIColors.navyBlue,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

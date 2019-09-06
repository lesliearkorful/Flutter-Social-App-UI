import 'package:flutter/material.dart';


class Pill extends StatelessWidget {
  final String text;
  final Color color;
  final bool selected;

  Pill({
    @required this.text,
    @required this.color,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text('$text',
        style: TextStyle(
          fontSize: 16,
          color: selected ? color : Colors.black26,
          fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
        ),
      ),
      decoration: BoxDecoration(
        color: selected ? color.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}
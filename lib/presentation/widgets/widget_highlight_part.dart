

import 'package:flutter/material.dart';

class WidgetHighlightPart extends StatelessWidget {
  final IconData icon;
  final Object title;
  final Object subTitle;
  const WidgetHighlightPart({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.lightBlue,
          size: 25,
        ),
        Text(
          title.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Text(
          subTitle.toString(),
          style: const TextStyle(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SharedWidgets {
  static Widget card(iconName, iconColor, cardColor, elevation) {
    return Card(
        elevation: elevation,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FaIcon(
            iconName,
            size: 25,
            color: iconColor,
          ),
        ));
  }
  static Widget text(String title, {textStyle}) {
    return Text(
      title,
      style: textStyle,
    );
  }
}

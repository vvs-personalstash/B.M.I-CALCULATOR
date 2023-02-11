import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi__calculator/components/constants.dart';

class MyWidget extends StatelessWidget {
  MyWidget({required this.cardwidget, required this.label});
  final String label;
  final IconData cardwidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardwidget,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelstyle,
        )
      ],
    );
  }
}

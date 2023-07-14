import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/main.dart';
import 'package:restadmin/page/bron/BronPage.dart';

import '../../../Utils.dart';

class BronELevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool? circle;
  bool select;
  final Color circleColor;
  final double radius;
  final int day;
  BronELevatedButton({
    super.key, required this.text, this.circle, required this.circleColor, required this.radius, required this.select, required this.day, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton (
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
            left: 15,
            right: 5
        ),
        backgroundColor: partDay[day] ? colorGreen3:Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: colorGreen2
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: partDay[day] ? Colors.white : colorGreen3
            ),
          ),
          SizedBox(width: 5,),
          CircleAvatar(
            radius: 5,
            backgroundColor: circleColor,
          )
        ],
      ),
    );
  }
}

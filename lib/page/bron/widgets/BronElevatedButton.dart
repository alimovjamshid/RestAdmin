import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/main.dart';
import 'package:restadmin/page/bron/BronPage.dart';

import '../../../Utils.dart';

class BronELevatedButton extends StatefulWidget {
  final String text;
  final bool? circle;
  bool select;
  final Color circleColor;
  final double radius;
  final int day;
  BronELevatedButton({
    super.key, required this.text, this.circle, required this.circleColor, required this.radius, required this.select, required this.day,
  });

  @override
  State<BronELevatedButton> createState() => _BronELevatedButtonState();
}

class _BronELevatedButtonState extends State<BronELevatedButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton (
      onPressed: ()  {
        setState(() {
          debugPrint(widget.day.toString());
          switch(widget.day){
            case 0:
              partDay[0]=!partDay[0];
              partDay[1]=false;
              partDay[2]=false;
              break;
            case 1:
              partDay[0]=false;
              partDay[1]=!partDay[1];
              partDay[2]=false;
              break;
            case 2:
              partDay[0]=false;
              partDay[1]=false;
              partDay[2]=!partDay[2];
              break;
          }
          debugPrint(partDay.toString());

        });
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
            left: 15,
            right: 5
        ),
        backgroundColor: partDay[widget.day] ? colorGreen3:Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: colorGreen2
          ),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: partDay[widget.day] ? Colors.white : colorGreen3
            ),
          ),
          SizedBox(width: 5,),
          CircleAvatar(
            radius: 5,
            backgroundColor: widget.circleColor,
          )
        ],
      ),
    );
  }
}

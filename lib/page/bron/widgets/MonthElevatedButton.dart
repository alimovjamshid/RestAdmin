import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';

class MonthElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final  bool select;
  final double radius;

  const MonthElevatedButton({super.key,  required this.text, required this.radius, required this.select, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: select ? colorGreen3:Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                color: colorGreen3
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: select ? Colors.white : colorGreen3
          ),
        ),
      ),
    );
  }
}

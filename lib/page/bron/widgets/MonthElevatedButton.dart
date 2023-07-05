import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthElevatedButton extends StatefulWidget {

  final String text;
  bool select;
  final double radius;

  MonthElevatedButton({super.key, required this.text, required this.radius, required this.select});

  @override
  State<MonthElevatedButton> createState() => _MonthElevatedButtonState();
}

class _MonthElevatedButtonState extends State<MonthElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ElevatedButton(
        onPressed: (){
          setState(() {
            widget.select = !widget.select;
          });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: widget.select ? Color(0xFF0B6561):Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                color: Color(0xFF0B6561)
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: widget.select ? Colors.white : Color(0xFF0B6561)
          ),
        ),
      ),
    );
  }
}

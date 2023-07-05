import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BronELevatedButton extends StatefulWidget {
  final String text;
  final bool? circle;
  bool select;
  final Color circleColor;
  final double radius;

  BronELevatedButton({
    super.key, required this.text, this.circle, required this.circleColor, required this.radius, required this.select,
  });

  @override
  State<BronELevatedButton> createState() => _BronELevatedButtonState();
}

class _BronELevatedButtonState extends State<BronELevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        setState(() {
          widget.select = !widget.select;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
            left: 15,
            right: 5
        ),
        backgroundColor: widget.select ? Color(0xFF0B6561):Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: Color(0xFF0B6561)
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
                color: widget.select ? Colors.white : Color(0xFF0B6561)
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

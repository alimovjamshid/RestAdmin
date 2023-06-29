import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double textRound;
  final Color color;
  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? textSize;
  const CustomElevatedButton({
    super.key, required this.text, required this.onPressed, this.buttonWidth, this.buttonHeight, this.textSize, required this.textRound, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: textSize
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(textRound)),
          primary: color
        ),
      ),
    );
  }
}
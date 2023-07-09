import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color textColor;
  final String text;
  final double borderRadius;
  final Color color;
  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? textSize;
  const CustomElevatedButton({
    super.key, required this.text, required this.onPressed, this.buttonWidth, this.buttonHeight, this.textSize, required this.borderRadius, required this.color, required this.textColor,
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
              fontSize: textSize,
            color: textColor
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          primary: color
        ),
      ),
    );
  }
}
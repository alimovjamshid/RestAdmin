import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? textSize;
  const CustomElevatedButton({
    super.key, required this.text, required this.onPressed, this.buttonWidth, this.buttonHeight, this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              fontSize: textSize
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Color(
            0xFF0B6561,
          ),
        ),
      ),
    );
  }
}
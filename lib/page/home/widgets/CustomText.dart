import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color circleColor;
  const CustomText({
    super.key,required this.text, required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 120,
        height: 25,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6)
                )
            ),
            color: colorGreen4
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              widthFactor: 10,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: circleColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}


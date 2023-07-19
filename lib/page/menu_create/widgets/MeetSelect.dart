import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class MeetSelect extends StatelessWidget {
  const MeetSelect({super.key, required this.width, required this.name, required this.weight, required this.onPressed});

  final double width;
  final String name;
  final String weight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(color: colorGreen2,width: 1)
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: width * 0.025,),
                Container(
                    width: width * 0.3,
                    child: Text(name,)
                ),
                Container(
                  color: colorGreen2,
                  width: 1,
                  height: 30,
                ),
                // SizedBox(width: width * 0.025,),
                Container(
                    padding: EdgeInsets.only(left: width * 0.025),
                    width: width * 0.35,
                    child: Text(weight)),
              ],
            ),
          ),
          IconButton(onPressed: onPressed,padding: EdgeInsets.zero, icon: ImageIcon(AssetImage("assets/removeCircle.png"),color: colorGreen2,size: 30,))
        ],
      ),
    );
  }
}

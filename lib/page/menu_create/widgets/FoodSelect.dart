import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class FoodSelect extends StatelessWidget {
  const FoodSelect({
    super.key,
    required this.width, required this.name, required this.price, required this.person, required this.onPressed,
  });

  final double width;
  final String name;
  final String price;
  final String person;
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
                    width: width * 0.23,
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
                    width: width * 0.25,
                    child: Text(price)),
                // SizedBox(width: width * 0.13,),
                Container(
                  color: colorGreen2,
                  width: 1,
                  height: 30,
                ),
                // SizedBox(width: width * 0.025,),
                Container(
                    padding: EdgeInsets.only(left: width * 0.025),
                    width: width * 0.18,
                    child: Text(person)),
              ],
            ),
          ),
          IconButton(onPressed: onPressed,padding: EdgeInsets.zero, icon: ImageIcon(AssetImage("assets/removeCircle.png"),color: colorGreen2,size: 30,))
        ],
      ),
    );
  }
}


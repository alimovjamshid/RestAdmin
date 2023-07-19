import 'package:flutter/cupertino.dart';

import '../../../Utils.dart';

class FoodName extends StatelessWidget {
  const FoodName({
    super.key,
    required this.width, required this.name, required this.price, required this.person,
  });

  final double width;
  final String name;
  final String price;
  final String person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: ShapeDecoration(
              color: colorGreenLight,
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
                    child: Text(name)
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
                    width: width * 0.32,
                    child: Text(person)),
              ],
            ),
          ),
          // IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/removeCircle.png"),color: colorGreen2,size: 30,))
        ],
      ),
    );
  }
}


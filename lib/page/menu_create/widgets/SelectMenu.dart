import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class SelectMenu extends StatelessWidget {
  const SelectMenu({
    super.key,
    required this.width, required this.label, required this.food1, required this.food2, required this.foodPerson, required this.imageAssets,
  });

  final double width;
  final String label;
  final String food1;
  final String food2;
  final String foodPerson;
  final String imageAssets;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        height: 260,
        width: width,
        child: Stack(
          children: [
            Container(
              height: 260,
              width: width,
              child: Image.asset(
                imageAssets,
                fit: BoxFit.none,
                color: Colors.black.withOpacity(0.5),
                colorBlendMode: BlendMode.darken,
              ),
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft: Radius.circular(6))
                        ),
                        color: colorGreen2
                    ),
                    child: Center(child: Text(label,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text("1 taom - $food1",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text("2 taom - $food2",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("1 kishiga $foodPerson ming menu",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

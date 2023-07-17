import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class OldText extends StatelessWidget {
  const OldText({
    super.key, required this.text1, required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: colorGreen2
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Umumiy summa",style: TextStyle(color: Colors.white,fontSize: 16)),
          Container(width: 1,color: Colors.white,),
          Text("5 000 000",style: TextStyle(color: Colors.white,fontSize: 16),)
        ],
      ),
    );
  }
}

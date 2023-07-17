import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class SelectWaiter extends StatelessWidget {
  const SelectWaiter({super.key, required this.label, required this.count, required this.minusOnPassed, required this.addOnPassed});

  final String label;
  final String count;
  final VoidCallback minusOnPassed;
  final VoidCallback addOnPassed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Stack(
        children: [
          Align(
            child: Text(label,style: TextStyle(fontSize: 16)),
            alignment: Alignment(-0.85,0),
          ),
          Align(
            alignment: Alignment(-0.1, 0),
            child: Container(width: 1,color: colorGreen2),
          ),
          Align(
            alignment: Alignment(0.85, 0),
            child: Container(
              height: 30,
              width: 150,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(color: colorGreen3,width: 1.5)
                )
              ),
              child: Stack(
                children: [
                  Align(
                    child: IconButton(padding: EdgeInsets.zero,onPressed: minusOnPassed, icon: ImageIcon(AssetImage("assets/remove.png"),size: 20,)),
                    alignment: Alignment(-0.95, 0),
                  ),
                  Align(
                      child: Container(width: 1.5,color: colorGreen3,),
                    alignment: Alignment(-0.3, 0),
                  ),
                  Align(
                      child: Text(count),
                  alignment: Alignment(0,0),),
                  Align(
                      child: Container(width: 1.5,color: colorGreen3,),
                    alignment: Alignment(0.3, 0),
                  ),
                  Align(
                    child: IconButton(padding: EdgeInsets.zero,onPressed: addOnPassed, icon: ImageIcon(AssetImage("assets/add.png"),size: 20,)),
                    alignment: Alignment(0.95, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

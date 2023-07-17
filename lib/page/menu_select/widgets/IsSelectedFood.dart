import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class IsSelectedFood extends StatelessWidget {
  const IsSelectedFood({
    super.key,
    required this.width, required this.label, required this.weight, required this.ischecket, required this.onChanged,
  });

  final double width;
  final String label;
  final String weight;
  final bool ischecket;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: width - 40 - 100,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: colorGreen3,width: 1.5)
                  )
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-0.8, 0),
                    child: Text(label),
                  ),
                  Align(
                    alignment: Alignment(0.2, 0),
                    child: Container(
                      width: 1.5,
                      color: colorGreen3,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.7, 0),
                    child: Text(weight),
                  )
                ],
              ),
            ),
            Transform.scale(
              scale: 2.2,
              child: Checkbox(
                value: ischecket,
                onChanged: onChanged,
                side: BorderSide(color: colorGreen3,width: 0.8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                activeColor: colorGreen3,
                autofocus: true,
                checkColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
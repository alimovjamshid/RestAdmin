import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class OldTextField extends StatelessWidget {
  final String text;
  final double width;
  final Color textColor;
  const OldTextField({
    super.key, required this.text, required this.width, required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: colorGreen2,
            width: 1,
          )
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(width: 100,child: Text(text,style: TextStyle(color: textColor),)),
          Container(
            width: 1,
            color: colorGreen2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width-width,
            child: TextField(
              style: TextStyle(fontSize: 18),
              keyboardType: TextInputType.text,
              scrollPadding: EdgeInsets.zero,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide:
                      BorderSide( color: Colors.transparent
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none,
                      gapPadding: 0
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
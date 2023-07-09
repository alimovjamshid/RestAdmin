import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class NewTextField extends StatelessWidget {
  final String text;
  const NewTextField({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        style: TextStyle(fontSize: 18),
        keyboardType: TextInputType.text,
        scrollPadding: EdgeInsets.zero,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: text,
            hintStyle: TextStyle(fontSize: 18,color: colorText),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                BorderSide( color: colorGreen2
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: colorGreen2),
                gapPadding: 0
            )
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';

import 'CustomELevetedButton.dart';


// ignore: non_constant_identifier_names
void CustomExpanceDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    useSafeArea: false,
    useRootNavigator: true,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 55,
              decoration: ShapeDecoration(
                  color: colorGreen3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)))),
              // color: Color(0xFF0B6561),
              child: const Center(
                child: Text(
                  "Harajatlar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Qilingan harajatlar",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Gilroy',
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Sveto muzika",
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                            BorderSide(width: 5, color: Colors.black))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Summasi",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Gilroy',
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "1 000 000",
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                            BorderSide(width: 5, color: Colors.black))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        textColor: Colors.white,
                        text: "Bekor qilish",
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        borderRadius: 6,
                        color: colorGreen1,
                        buttonHeight: 50,
                        textSize: 16,
                      ),
                      CustomElevatedButton(
                        textColor: Colors.white,
                        text: "Tasdiqlash",
                        onPressed: () {},
                        borderRadius: 6,
                        color: colorGreen2,
                        buttonHeight: 50,
                        textSize: 16,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

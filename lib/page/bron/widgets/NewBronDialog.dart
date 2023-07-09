import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/home/widgets/CustomELevetedButton.dart';

import 'NevTextField.dart';

void NewBronDialog(BuildContext context, int month, int day,){
  showDialog(
    useRootNavigator: true,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Align(
                        heightFactor: 3,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 100,
                          child: Column(
                            children: [
                              Text("Tongi marosim",style: TextStyle(color: colorText)),
                              SizedBox(height: 4,),
                              Container(height: 1,color: colorGreen2,)
                            ],
                          ),
                        ),
                      ),
                      Center(
                        heightFactor: 2,
                          child: Text(
                            "${day}-${months[month-1]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                            ),
                          )
                      ),
                      Align(
                        heightFactor: 1,
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            padding: EdgeInsets.zero,
                            icon: ImageIcon(AssetImage("assets/cancel.png"),size: 40,color: colorGreen2,)
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewTextField(text: "I.F.SH"),
                  SizedBox(
                    height: 10,
                  ),
                  NewTextField(text: "Telefon raqam"),
                  SizedBox(
                    height: 10,
                  ),
                  NewTextField(text: "2-telefon raqam"),
                  SizedBox(
                    height: 10,
                  ),
                  NewTextField(text: "Berilgan zaklat"),
                  SizedBox(
                    height: 10,
                  ),
                  NewTextField(text: "Manzil"),
                  SizedBox(
                    height: 10,
                  ),
                  NewTextField(text: "Qo'shimcha ma'lumotlar",),
                  SizedBox(
                    height: 10,
                  ),
                  CustomElevatedButton(textColor: Colors.white,text: "Tasdiqlash", onPressed: (){}, borderRadius: 6, color: colorGreen2,buttonWidth: 500, buttonHeight: 45,),
                  SizedBox(
                    height: 15,
                  )
                ]
              ),
            ),
          ),
        );
      },
  );
}


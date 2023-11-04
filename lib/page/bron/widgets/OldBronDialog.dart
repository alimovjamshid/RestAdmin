import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';
import '../../home/widgets/CustomELevetedButton.dart';
import 'OldTextField.dart';

void OldBronDialog(
  BuildContext context,
  int month,
  int day,
  TextEditingController nameController,
  TextEditingController phoneController,
  TextEditingController secondPhoneController,
  TextEditingController paidPriceController,
  TextEditingController addressController,
  TextEditingController otherController,
  dynamic sendCallBack,
  dynamic deleteCallBack,
) {
  showDialog(
      useRootNavigator: true,
      useSafeArea: true,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
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
                              Text("Tongi marosim",
                                  style: TextStyle(color: colorText)),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 1,
                                color: colorGreen2,
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                          heightFactor: 2,
                          child: Text(
                            "${day}-${months[month - 1]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )),
                      Align(
                        heightFactor: 1,
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            padding: EdgeInsets.zero,
                            icon: ImageIcon(
                              AssetImage("assets/cancel.png"),
                              size: 40,
                              color: colorGreen2,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OldTextField(
                      textEditingController: nameController,
                      text: "F.I.SH",
                      width: 180,
                      textColor: colorText),
                  SizedBox(
                    height: 10,
                  ),
                  OldTextField(
                      textEditingController: phoneController,
                      text: "Telefon raqam",
                      width: 180,
                      textColor: colorText),
                  SizedBox(
                    height: 10,
                  ),
                  OldTextField(
                      textEditingController: secondPhoneController,
                      text: "2-telefon raqam",
                      width: 180,
                      textColor: colorText),
                  SizedBox(
                    height: 10,
                  ),
                  OldTextField(
                      textEditingController: paidPriceController,
                      text: "Berilgan zaklat",
                      width: 180,
                      textColor: colorText),
                  SizedBox(
                    height: 10,
                  ),
                  OldTextField(
                      textEditingController: addressController,
                      text: "Manzil",
                      width: 180,
                      textColor: colorText),
                  SizedBox(
                    height: 10,
                  ),
                  OldTextField(
                      textEditingController: otherController,
                      text: "Qo'shimcha ma'lumotlar",
                      width: 180,
                      textColor: colorText),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        text: "O'chirish",
                        onPressed: deleteCallBack,
                        textColor: Colors.black,
                        borderRadius: 6,
                        color: colorView,
                        buttonHeight: 45,
                        buttonWidth: 130,
                        textSize: 16,
                      ),
                      CustomElevatedButton(
                        textColor: Colors.white,
                        text: "Tahrirlash",
                        onPressed: sendCallBack,
                        borderRadius: 6,
                        color: colorGreen2,
                        buttonHeight: 45,
                        buttonWidth: 130,
                        textSize: 16,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

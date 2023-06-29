import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/home/widgets/CustomELevetedButton.dart';
import 'package:restadmin/page/home/widgets/CustomIconButton.dart';

class HomePage extends StatelessWidget {

  final Utils utils = Utils();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Image.asset(
                "assets/img.png",
                width: width,
                height: 162,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 143),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  text: "Tahlil",
                  textRound: 20,
                  onPressed: () {},
                  buttonHeight: 40,
                  buttonWidth: 120,
                  textSize: 16,
                  color: Color(0xFF0B6561),
                ),
                CustomElevatedButton(
                  text: "Harajatlar",
                  textRound: 20,
                  color: Color(0xFF0B6561),
                  onPressed: () {
                    _showDialog(context);
                  },
                  buttonHeight: 40,
                  buttonWidth: 120,
                  textSize: 16,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 38, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () {},
                  imageIcon: "assets/calendar.png",
                  height: 35,
                  width: 35,
                  borderRadius: 7,
                ),
                CustomIconButton(
                  onPressed: () {
                    utils.scaffoldKey.currentState?.openEndDrawer();
                  },
                  imageIcon: "assets/settings.png",
                  height: 35,
                  width: 35,
                  borderRadius: 7,
                )
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 210, left: 20, right: 20, bottom: 30),
            width: width,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            child: Column(
              children: [],
            ),
          )
        ]),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    useSafeArea: true,
    useRootNavigator: true,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 55,
              decoration: const ShapeDecoration(
                  color: Color(0xFF0B6561),
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
                        text: "Bekor qilish",
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        textRound: 6,
                        color: Color(0xFF7EB9B7),
                        buttonHeight: 50,
                        textSize: 16,
                      ),
                      CustomElevatedButton(
                        text: "Tasdiqlash",
                        onPressed: () {},
                        textRound: 6,
                        color: Color(0xFF32A09C),
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

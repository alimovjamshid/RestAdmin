import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/home/widgets/CustomCalendarDialog.dart';
import 'package:restadmin/page/home/widgets/CustomExpanceDialog.dart';
import 'package:restadmin/page/home/widgets/CustomELevetedButton.dart';
import 'package:restadmin/page/home/widgets/CustomIconButton.dart';

class HomePage extends StatelessWidget {


  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Stack(children: [
          Image.asset(
            "assets/img.png",
            width: width,
            height: 162,
            fit: BoxFit.fill,
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
                    CustomExpanceDialog(context);
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
                  onPressed: () {
                    Navigator.of(context).pop(aka());
                    // CustomCalendarDialog(context);
                  },
                  imageIcon: "assets/calendar.png",
                  height: 35,
                  width: 35,
                  borderRadius: 7,
                ),
                CustomIconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../home/widgets/CustomCalendarDialog.dart';
import '../home/widgets/CustomIconButton.dart';
import '../home/widgets/DropDown.dart';

class MenuSelectPage extends StatelessWidget {
  const MenuSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "assets/img.png",
            width: width,
            height: 162,
            fit: BoxFit.fill,
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
            const EdgeInsets.only(top: 81, left: 20, right: 20, bottom: 30),
            width: width,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height:   60,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "Band qilish",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                              right: 10,
                              top: 10
                          ),
                          child: Image.asset("assets/pick.png"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xFFE3F8F7),
                    child: Dropdown(),
                  ),
                  TableCalendar(
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(2020,01,01),
                      lastDay: DateTime.utc(2030,12,31)
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

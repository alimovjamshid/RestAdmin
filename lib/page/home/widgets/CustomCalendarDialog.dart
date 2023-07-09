import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/home/widgets/DropDown.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: non_constant_identifier_names


void CustomCalendarDialog(BuildContext context){
  showDialog(
    barrierDismissible: true,
    useSafeArea: true,
    useRootNavigator: true,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              color: colorAppBarLight,
              child: Dropdown(),
            ),
            TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2020,01,01),
                lastDay: DateTime.utc(2030,01,01)
            ),
          ],
        ),
      );
    },
  );
}
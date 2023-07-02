import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/page/home/widgets/DropDown.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: non_constant_identifier_names

class aka extends StatefulWidget {
  const aka({super.key});

  @override
  State<aka> createState() => _akaState();
}

class _akaState extends State<aka> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      color: Colors.amber,
      child: Text("salom")
    );
  }
}

void CustomCalendarDialog(BuildContext context){
  showDialog(
    barrierDismissible: true,
    useSafeArea: true,
    useRootNavigator: true,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
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
              color: Color(0xFFE3F8F7),
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
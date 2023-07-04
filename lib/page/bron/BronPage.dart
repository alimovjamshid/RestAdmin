import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restadmin/page/home/widgets/CustomELevetedButton.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Utils.dart';
import '../home/widgets/CustomCalendarDialog.dart';
import '../home/widgets/CustomIconButton.dart';
import '../home/widgets/DropDown.dart';

class BronPage extends StatefulWidget {
  const BronPage({super.key});

  @override
  State<BronPage> createState() => _BronPageState();
}

class _BronPageState extends State<BronPage> {

  DateTime today = DateTime.now();

  Map<DateTime, List> _eventsList = {};

  void _onDaySelected(DateTime day, DateTime focusDay){
    setState(() {
      debugPrint(day.toString());
      today = day;
    });
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    _eventsList = {
      DateTime.now().subtract(Duration(days: 2)): ['Event A1', 'Event B1'],
      DateTime.now(): ['Event A2', 'Event B2', 'Event C1', 'Event D1'],
      DateTime.now().add(Duration(days: 1)): [
        'Event A3',
        'Event B3',
        'Event C2',
        'Event D2'
      ],
      DateTime.now().add(Duration(days: 3)):
      Set.from(['Event A4', 'Event A5', 'Event B4']).toList(),
      DateTime.now().add(Duration(days: 7)): [
        'Event A6',
        'Event B5',
        'Event C3'
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }
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
              primary: false,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
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
                    availableGestures: AvailableGestures.none,
                    rowHeight: 40,
                    locale: 'uz_UZ',
                    calendarStyle: CalendarStyle(
                      // markerDecoration: BoxDecoration(
                      //   color: Colors.tealAccent,
                      //   borderRadius: BorderRadius.circular(6),
                      //   shape: BoxShape.rectangle
                      // ),
                      markersAutoAligned: true,
                      // markersMaxCount: 1,
                      // markersAlignment: Alignment.center,
                      // markersAnchor: 10,
                      // markerSize: 30,
                      // canMarkersOverflow: false,
                      // cellMargin: EdgeInsets.all(6),
                      // markerMargin: EdgeInsets.all(6),
                      // markerSizeScale: 30,
                      todayDecoration: BoxDecoration(
                        color: Color(0xFF95DBD8),
                        borderRadius: BorderRadius.circular(6),
                        shape: BoxShape.rectangle
                      ),
                      defaultTextStyle: TextStyle(
                        color: Colors.black
                      ),
                      todayTextStyle: TextStyle(
                        color: Colors.black
                      ),
                      weekendTextStyle: TextStyle(
                        color: Colors.black
                      ),
                      outsideDaysVisible: true,
                      selectedDecoration: BoxDecoration(
                        color: const Color(0xFF0B6561),
                        borderRadius: BorderRadius.circular(6),
                        shape: BoxShape.rectangle,
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      outsideDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6)
                      ),
                    ),
                    eventLoader: getEventForDay,
                    // onHeaderTapped: (focusday){
                    //   debugPrint(focusday.toString());
                    // },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekendStyle: TextStyle(
                          color: Color(0xFFC57B7B)
                        )
                      ),
                      headerVisible: true,
                      calendarFormat: CalendarFormat.month,
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonVisible: false,
                        rightChevronVisible: true,
                        leftChevronVisible: true,
                        titleTextFormatter: (date, locale) {
                          return month[date.month-1];
                        },
                        leftChevronIcon: ImageIcon(AssetImage("assets/left.png"),color: Color(0xFFB6C9C8),size: 35),
                        rightChevronIcon: ImageIcon(AssetImage("assets/right.png"),color: Color(0xFFB6C9C8),size: 35,),
                          headerPadding: EdgeInsets.symmetric(vertical: 0),
                        titleTextStyle: TextStyle(
                          color: Color(0xFF0B6561),
                          fontSize: 20
                        )
                      ),
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(2020,01,01),
                      lastDay: DateTime.utc(2030,12,31),
                    selectedDayPredicate: (day) => isSameDay(day,today),
                    onDaySelected: _onDaySelected,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomElevatedButton(text: "Tongi", onPressed: (){}, textRound: 6, color: Colors.tealAccent),
                      CustomElevatedButton(text: "Tongi", onPressed: (){}, textRound: 6, color: Colors.tealAccent),
                      CustomElevatedButton(text: "Tongi", onPressed: (){}, textRound: 6, color: Colors.tealAccent)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: 260,
                    color: Color(0xFFC0C0C0),
                  ),
                  Container(
                    child: Card(
                      child: Text("Bahor restarurant"),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

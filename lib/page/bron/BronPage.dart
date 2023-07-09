
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restadmin/page/bron/widgets/BronElevatedButton.dart';
import 'package:restadmin/page/bron/widgets/CustomAppBar.dart';
import 'package:restadmin/page/bron/widgets/CustomCalendar.dart';
import 'package:restadmin/page/bron/widgets/MonthElevatedButton.dart';
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

List _isSelected = [false, true, false];

class _BronPageState extends State<BronPage> {

  DateTime today = DateTime.now();

  DateTime _focusedDay = DateTime.now();

  final Set<DateTime> _selectedDays = <DateTime>{};

  void _onDaySelected( selectedDay, focusDay){
    setState(() {
      _focusedDay = focusDay;
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
      debugPrint(selectedDay.toString());
    });
  }

  @override
  void initState() {
    BronPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget pageSection = const BronPage();

    _selectedDays.add(DateTime.utc(2023,07,6));
    _selectedDays.add(DateTime.utc(2023,07,10));
    _selectedDays.add(DateTime.utc(2023,07,17));
    _selectedDays.add(DateTime.utc(2023,07,23));

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
                    CustomCalendarDialog(context);
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
                  CustomAppBar(text: "Band qilish"),
                  Dropdown(),
                  CustomCalendar(focusedDay: _focusedDay, selectedDays: _selectedDays),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BronELevatedButton(text: "Tongi",circleColor: colorGreen,circle: true,radius: 4,select: partDay[0] ,day: 0),
                        BronELevatedButton(text: "Kunduzgi",circleColor: colorBlue,circle: true,radius: 4,select: partDay[1], day: 1,),
                        BronELevatedButton(text: "Kechki",circleColor: colorPink,circle: true,radius: 4,select: partDay[2], day: 2),
                      ],
                    ),
                  ),
                  // Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 20),
                  //   child: ToggleButtons(
                  //     onPressed: (int index) {
                  //       setState(() {
                  //         for(int i=0;i<partDay.length;i++){
                  //           partDay[i] = i == index;
                  //         }
                  //         debugPrint(partDay.toString());
                  //       });
                  //     },
                  //     borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //     selectedBorderColor: Colors.red[700],
                  //     selectedColor: Colors.white,
                  //     borderColor: Colors.tealAccent,
                  //     fillColor: Colors.red[200],
                  //     color: Colors.red[400],
                  //     constraints: const BoxConstraints(
                  //       minHeight: 40.0,
                  //       minWidth: 80.0,
                  //     ),
                  //
                  //     tapTargetSize: MaterialTapTargetSize.padded,
                  //     isSelected: partDay,
                  //     children: [  Text('Apple'),
                  //       Text('Banana'),
                  //       Text('Orange')],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 1,
                      color: colorView,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(text: months[0],  radius: 40, select: false),
                        MonthElevatedButton(text: months[1],  radius: 40, select: false),
                        MonthElevatedButton(text: months[2],  radius: 40, select: false)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(text: months[3],  radius: 40, select: true),
                        MonthElevatedButton(text: months[4],  radius: 40, select: false),
                        MonthElevatedButton(text: months[5],  radius: 40, select: false)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(text: months[6],  radius: 40, select: false),
                        MonthElevatedButton(text: months[7],  radius: 40, select: false),
                        MonthElevatedButton(text: months[8],  radius: 40, select: false)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(text: months[9],  radius: 40, select: false),
                        MonthElevatedButton(text: months[10],  radius: 40, select: false),
                        MonthElevatedButton(text: months[11],  radius: 40, select: false)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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


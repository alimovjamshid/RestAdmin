import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restadmin/page/bron/widgets/BronElevatedButton.dart';
import 'package:restadmin/page/bron/widgets/CustomAppBar.dart';
import 'package:restadmin/page/bron/widgets/CustomCalendar.dart';
import 'package:restadmin/page/bron/widgets/MonthElevatedButton.dart';
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

  final Set<DateTime> _selectedDays = <DateTime>{};

  @override
  void initState() {
    BronPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    _selectedDays.add(DateTime.utc(2023, 07, 6));
    _selectedDays.add(DateTime.utc(2023, 07, 10));
    _selectedDays.add(DateTime.utc(2023, 07, 17));
    _selectedDays.add(DateTime.utc(2023, 07, 23));

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
                    CustomCalendarDialog(context,(p0) {

                    },(p0) {

                    },);
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
                  Dropdown(onPressed: (value) {
                    setState(() {
                      selectYear = value!;
                      year = int.parse(value);
                    });
                  } ,selectValue: selectYear,list: listYears),

                  CustomCalendar(onPressed: (focusedDay) {
                    setState(() {
                      month = focusedDay.month;
                      debugPrint(month.toString());
                      for(int i=0;i<partMonth.length;i++){
                        partMonth[i] = month-1==i;
                      }
                      debugPrint(partMonth.toString());
                    });
                  },focusedDay: DateTime.utc(year,month,day), selectedDays: _selectedDays),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BronELevatedButton(
                            onPressed: () {
                              setState(() {
                                partDay[0] = !partDay[0];
                                partDay[1] = false;
                                partDay[2] = false;
                                debugPrint(partDay.toString());
                              });
                            },
                            text: "Tongi",
                            circleColor: colorGreen,
                            circle: true,
                            radius: 4,
                            select: partDay[0],
                            day: 0),
                        BronELevatedButton(
                          onPressed: () {
                            setState(() {
                              partDay[1] = !partDay[1];
                              partDay[0] = false;
                              partDay[2] = false;
                              debugPrint(partDay.toString());
                            });
                          },
                          text: "Kunduzgi",
                          circleColor: colorBlue,
                          circle: true,
                          radius: 4,
                          select: partDay[1],
                          day: 1,
                        ),
                        BronELevatedButton(
                            onPressed: () {
                              setState(() {
                                partDay[2] = !partDay[2];
                                partDay[1] = false;
                                partDay[0] = false;
                                debugPrint(partDay.toString());
                              });
                            },
                            text: "Kechki",
                            circleColor: colorPink,
                            circle: true,
                            radius: 4,
                            select: partDay[2],
                            day: 2),
                      ],
                    ),
                  ),
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
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 0==i;
                                }
                              });
                              month = 1;
                            },text: months[0], radius: 40, select: partMonth[0]),
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 1==i;
                                }
                              });
                              month = 2;
                            },text: months[1], radius: 40, select: partMonth[1]),
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 2==i;
                                }
                              });
                              month = 3;
                            },text: months[2], radius: 40, select: partMonth[2]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 3==i;
                                }
                              });
                              month = 4;
                            },text: months[3], radius: 40, select: partMonth[3]),
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 4==i;
                                }
                              });
                              month = 5;
                            },text: months[4], radius: 40, select: partMonth[4]),
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 5==i;
                                }
                              });
                              month=6;
                            },text: months[5], radius: 40, select: partMonth[5]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 6==i;
                                }
                              });
                              month = 7;
                            },text: months[6], radius: 40, select: partMonth[6]),
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 7==i;
                                }
                              });
                              month = 8;
                            },text: months[7], radius: 40, select: partMonth[7]),
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 8==i;
                                }
                              });
                              month = 9;
                            },text: months[8], radius: 40, select: partMonth[8]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 9==i;
                                }
                              });
                              month = 10;
                            },text: months[9], radius: 40, select: partMonth[9]),
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 10==i;
                                }
                              });
                              month = 11;
                            },text: months[10], radius: 40, select: partMonth[10]),
                        MonthElevatedButton(
                            onPressed: (){
                              setState(() {
                                for(int i=0;i<partMonth.length;i++){
                                  partMonth[i] = 11==i;
                                }
                              });
                              month = 12;
                            },text: months[11], radius: 40, select: partMonth[11]),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/page/bron/widgets/CustomCalendar.dart';
import 'package:restadmin/page/bron/widgets/NevTextField.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Utils.dart';
import '../bron/widgets/BronElevatedButton.dart';
import '../bron/widgets/OldTextField.dart';
import '../home/widgets/CustomCalendarDialog.dart';
import '../home/widgets/CustomIconButton.dart';
import '../home/widgets/DropDown.dart';

class MenuSelectPage extends StatelessWidget {
  MenuSelectPage({super.key});

  DateTime _focusedDay = DateTime.now();

  final Set<DateTime> _selectedDays = <DateTime>{};

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height:   60,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "Menu tanlash",
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
                  Dropdown(),
                  CustomCalendar(focusedDay: DateTime.now(), selectedDays: _selectedDays),
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
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 1,
                      color: colorView,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Container(
                        height: 30,
                        width: 140,
                        alignment: Alignment.centerLeft,
                        decoration: ShapeDecoration(
                          color: colorGreen3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6)
                            )
                          ),
                        ),
                        child: Center(child: Text("Bahor Restaurant",style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Text("2-May",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      // height: 500,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(color: colorGreen3,width: 1)
                        )
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                              decoration: ShapeDecoration(
                                color: colorGreen3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(6),
                                    topLeft: Radius.circular(4)
                                  )
                                )
                              ),
                              child: Text("Izoh",style: TextStyle(color: Colors.white,fontSize: 14)),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(text: "F.I.SH",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(text: "Tel raqam",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(text: "Tel raqam 2",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(text: "Oldindon to'lov",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(text: "Manzil",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(text: "Mehmonlar soni",width: 205,textColor: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(text: "Kechki bazim",width: 205,textColor: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(text: "Boshlanish vaqti",width: 205,textColor: Colors.black),
                          ),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Menu Tanlash",style: TextStyle(color: Colors.black,fontSize: 14)),
                  SizedBox(height: 5,),
                  Text("Standart Menu",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500)),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/page/bron/widgets/CustomCalendar.dart';
import 'package:restadmin/page/menu_select/widgets/CustomExpandablePanel.dart';
import 'package:restadmin/page/menu_select/widgets/IsSelectedFood.dart';
import 'package:restadmin/page/menu_select/widgets/OldText.dart';
import 'package:restadmin/page/menu_select/widgets/SelectFood.dart';
import 'package:restadmin/page/menu_select/widgets/SelectService.dart';
import 'package:restadmin/page/menu_select/widgets/SelectWaiter.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Utils.dart';
import '../bron/widgets/BronElevatedButton.dart';
import '../bron/widgets/CustomAppBar.dart';
import '../bron/widgets/OldTextField.dart';
import '../home/widgets/CustomCalendarDialog.dart';
import '../home/widgets/CustomIconButton.dart';
import '../home/widgets/DropDown.dart';

class MenuSelectPage extends StatefulWidget {
  MenuSelectPage({super.key});

  @override
  State<MenuSelectPage> createState() => _MenuSelectPageState();
}

class _MenuSelectPageState extends State<MenuSelectPage> {
  DateTime _focusedDay = DateTime.utc(year,month,day);
  final ExpandableController defaultExpandableController = ExpandableController();
  final ExpandableController premiumExpandableController = ExpandableController();

  final ExpandableController selectExpandableController1 = ExpandableController();
  final ExpandableController selectExpandableController2 = ExpandableController();
  final ExpandableController selectExpandableController3 = ExpandableController();

  final Set<DateTime> _selectedDays = <DateTime>{};
  bool defaultChecket = false;
  bool premiumChecket = false;

  bool selectServiceChecket1 = false;
  bool selectServiceChecket2 = false;
  bool selectServiceChecket3 = false;

  String count = "2";

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
                    CustomCalendarDialog(context,(p0) {},(value) {setState(() {
                      // selectYear = value!;
                      // year = int.parse(value);
                    });},);
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
                  CustomAppBar(text: "Menu tanlash"),
                  Dropdown(onPressed: (value) {
                    setState(() {
                      selectYear = value!;
                      year = int.parse(value);
                    });
                  } ,selectValue: selectYear,list: listYears),
                  // CustomCalendar(onPressed: (day) {
                  //   setState(() {
                  //     month = day.month;
                  //     debugPrint(month.toString());
                  //     for(int i=0;i<partMonth.length;i++){
                  //       partMonth[i] = month-1==i;
                  //     }
                  //     debugPrint(partMonth.toString());
                  //   });
                  // return isSameDay(day, day);
                  // },onDaySelected: (selectedDay, focusDay) {
                  //   setState(() {
                  //     // selectedDay = focusDay;
                  //     // _selectedDays = selectedDay;
                  //
                  //     _focusedDay = focusDay;
                  //     // day = selectedDay.day;
                  //   });
                  // },focusedDay: _focusedDay, selectedDays: _selectedDays),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row (
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
                    child: Column(
                      children: [
                        Text("$day-${months[month-1]}",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)),
                        SizedBox(height: 3,),
                        Container(height: 1,width: 70,color: colorGreen2,)
                      ],
                    ),
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
                            child: OldTextField(textEditingController: TextEditingController(),text: "F.I.SH",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(textEditingController: TextEditingController(),text: "Tel raqam",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(textEditingController: TextEditingController(),text: "Tel raqam 2",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(textEditingController: TextEditingController(),text: "Oldindon to'lov",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(textEditingController: TextEditingController(),text: "Manzil",width: 205,textColor: colorText),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(textEditingController: TextEditingController(),text: "Mehmonlar soni",width: 205,textColor: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(textEditingController: TextEditingController(),text: "Kechki bazim",width: 205,textColor: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: OldTextField(textEditingController: TextEditingController(),text: "Boshlanish vaqti",width: 205,textColor: Colors.black),
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
                  CustomExpandablePanel(ischecket: defaultChecket, expandableController: defaultExpandableController,onPressed: (){
                    defaultExpandableController.expanded = !defaultExpandableController.expanded;
                  },onChanged: (value) {
                    setState(() {
                      defaultChecket = !defaultChecket;
                    });
                  },textColor: colorGreen2,background: Colors.white,expanded: Text("asasas"),label: "Oddiy menu",onPressedColor: colorSelect,personMoney: "1 kishiga 45 ming",checketColor: colorGreen2),
                  SizedBox(height: 20,),
                  CustomExpandablePanel(ischecket: premiumChecket, expandableController: premiumExpandableController,onPressed: (){
                    premiumExpandableController.expanded = !premiumExpandableController.expanded;
                  },onChanged: (value) {
                    setState(() {
                      premiumChecket = !premiumChecket;
                    });
                  },textColor: Colors.white,background: colorGreen2,expanded: Text("asasas"),label: "Premium menu",onPressedColor: Colors.white,personMoney: "1 kishiga 120 ming",checketColor: colorGreen2),
                  SizedBox(height: 20,),
                  OldText(text1: "Umumiy summa",text2: "5 000 000",),
                  SizedBox(height: 25,),
                  Text("Taom tanlash",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  SelectFood(label: "1-taom",expanded: Text("sssasdsahghjadsdsahb"),expandableController: selectExpandableController1,onPressed: () {
                    setState(() {
                      selectExpandableController1.expanded = !selectExpandableController1.expanded;
                    });
                  },),
                  SizedBox(height: 15,),
                  SelectFood(label: "2-taom",expanded: Text("sssasdsahghjadsdsahb"),expandableController: selectExpandableController2,onPressed: () {
                    setState(() {
                      selectExpandableController2.expanded = !selectExpandableController2.expanded;
                    });
                  },),
                  SizedBox(height: 15,),
                  SelectFood(label: "3-taom",expanded: Text("sssasdsahghjadsdsahb"),expandableController: selectExpandableController3,onPressed: () {
                    setState(() {
                      selectExpandableController3.expanded = !selectExpandableController3.expanded;
                    });
                  },),
                  SizedBox(height: 25,),
                  Text("Qo'shimcha xizmatlar",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Container(height: 1,color: colorGreen2,),
                      SelectService(label: "Saxna xizmati",moneyLabel: "\$120",ischecket: selectServiceChecket1,onChanged: (value) {
                        setState(() {
                          selectServiceChecket1 = !selectServiceChecket1;
                        });
                      },),
                      Container(height: 1,color: colorGreen2,),
                      SelectService(label: "Sveto-muzika",moneyLabel: "\$80",ischecket: selectServiceChecket2,onChanged: (value) {
                        setState(() {
                          selectServiceChecket2 = !selectServiceChecket2;
                        });
                      },),
                      Container(height: 1,color: colorGreen2,),
                      SelectService(label: "Affitsiantlar soni",moneyLabel: "\$100",ischecket: selectServiceChecket3,onChanged: (value) {
                        setState(() {
                          selectServiceChecket3 = !selectServiceChecket3;
                        });
                      },),
                      Container(height: 1,color: colorGreen2,),
                      SelectWaiter(label: "Affitsiantlar soni", addOnPassed: (){
                        setState(() {
                          int i = int.parse(count)+1;
                          count = i.toString();
                        });
                      },minusOnPassed: (){
                        setState(() {
                          int i = int.parse(count);
                          if(i>=1){
                            i--;
                          }
                          else{
                            i=0;
                          }
                          count = i.toString();
                        });
                      },count: count),
                      Container(height: 1,color: colorGreen2,),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: OldText(text1: "Umumiy summa", text2: "5 000 00"),
                      ),
                      SizedBox(height: 20,),
                      Text("Bozor ro'yxati",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                      SizedBox(height: 20,),
                      Container(
                        height: 45,
                        decoration: ShapeDecoration(
                          color: colorGreen3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6)),
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Go'shtli assorti",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),
                          Text("1 kishili stol",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      IsSelectedFood(width: width,onChanged: (value) {

                      },ischecket: false,label: "Tovuq go'shti",weight: "400gr",),
                      SizedBox(height: 10,),
                      IsSelectedFood(width: width,onChanged: (value) {

                      },ischecket: false,label: "Qazi",weight: "400gr",),
                      SizedBox(height: 10,),
                      IsSelectedFood(width: width,onChanged: (value) {

                      },ischecket: false,label: "Kolbasa",weight: "950gr",),
                      SizedBox(height: 10,),
                      IsSelectedFood(width: width,onChanged: (value) {

                      },ischecket: false,label: "Sir",weight: "900gr",),
                      SizedBox(height: 10,),
                      IsSelectedFood(width: width,onChanged: (value) {

                      },ischecket: false,label: "Mol go'shti",weight: "2kg",),
                      SizedBox(height: 10,),
                      IsSelectedFood(width: width,onChanged: (value) {

                      },ischecket: false,label: "Qo'y go'shti",weight: "1kg",),
                      SizedBox(height: 25,),
                      Container(
                        height: 45,
                        decoration: ShapeDecoration(
                            color: colorGreen3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6)),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Mevali assorti",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),
                              Text("1 kishili stol",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 80,),
                      Container(
                        height: 45,
                        decoration: ShapeDecoration(
                            color: colorGreen3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6)),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Non assorti",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),
                              Text("1 kishili stol",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 80,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorGreen1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
                        ),
                          onPressed: (){},
                          child: Text("Tasdiqlash")
                      ),
                      SizedBox(height: 15,)
                    ],
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

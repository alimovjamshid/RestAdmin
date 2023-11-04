import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restadmin/page/bron/model/ListDay.dart';
import 'package:restadmin/page/bron/widgets/BronElevatedButton.dart';
import 'package:restadmin/page/bron/widgets/CustomAppBar.dart';
import 'package:restadmin/page/bron/widgets/CustomCalendar.dart';
import 'package:restadmin/page/bron/widgets/LoadingDialog.dart';
import 'package:restadmin/page/bron/widgets/MonthElevatedButton.dart';
import 'package:restadmin/page/bron/widgets/NewBronDialog.dart';
import 'package:restadmin/page/bron/widgets/OldBronDialog.dart';
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
  final List<ListDay> _selectedDays = [];

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final secondPhoneController = TextEditingController();
  final paidPriceController = TextEditingController();
  final addressController = TextEditingController();
  final otherController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calendarGet("$year", "$month", "afternoon");
    });
  }

  Future<void> calendarGet(String year, String month, String partOfDay) async {
    LoadingDialog().show(context);
    await weddingsGetPartOfDay(year, month, partOfDay).then((value) {
      var data = value.data as List;
      _selectedDays.clear();
      for (var element in data) {
        debugPrint(element.toString());
        var time = DateTime.parse(element['date']).toUtc();
        var id = element['id'].toString();
        _selectedDays.add(ListDay(id: id, time: time));
      }
      LoadingDialog().dismiss();
      setState(() {
        _selectedDays;
      });
    });
  }

  Future<void> calendarDaySet(
      String date,
      int number,
      String price,
      String paidPrice,
      String provideId,
      String phone,
      String secondPhone,
      String name,
      String address,
      String extraInfo,
      String partOfDay,
      String status,
      bool verified) async {
    LoadingDialog().show(context);
    var response = await weddingPost(
        date,
        number,
        price,
        paidPrice,
        provideId,
        phone,
        secondPhone,
        name,
        address,
        extraInfo,
        partOfDay,
        status,
        verified);
    if (response.statusCode == 201) {
      calendarGet("$year", "$month", partOfDay);
    }
    LoadingDialog().dismiss();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future<void> calendarDayGet() async {
    LoadingDialog().show(context);
    await weddingsGetId(id).then((value) {
      var data = value.data as List;
      for (var element in data) {
        debugPrint(element.toString());
        nameController.text = element['customer_name'];
        phoneController.text = element['phone_number'];
        secondPhoneController.text = element['second_phone_number'];
        paidPriceController.text = element['paid_price'];
        addressController.text = element['address'];
        otherController.text = element['extra_info'];
      }
      LoadingDialog().dismiss();
    });
  }

  Future<void> calendarDayDelete() async {
    await weddingsDelete(id).then((response) {
      debugPrint("delete   $response");
      if(response.statusCode==200){
        Navigator.of(context).pop();
        calendarGet("$year", "$month", partOfDay);
      }
    });
  }

  Future<void> calendarDayPath(String date) async{
    // await weddingPatch(id, date, number, price, paidPrice, provideId, phone, name, address, extraInfo, partOfDay, status, verified)
  }

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
                    CustomCalendarDialog(
                      context,
                      (value) {
                        setState(() {
                          selectYear = value as String;
                          year = int.parse(value as String);
                        });
                      },
                      (p0) {},
                    );
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
                  Dropdown(
                      onPressed: (value) {
                        setState(() {
                          selectYear = value!;
                          year = int.parse(value);
                        });
                        calendarGet("$year", "$month", partOfDay);
                      },
                      selectValue: selectYear,
                      list: listYears),
                  CustomCalendar(
                      onPressed: (focusedDay) {
                        setState(() {
                          month = focusedDay.month;
                          debugPrint(month.toString());
                          for (int i = 0; i < partMonth.length; i++) {
                            partMonth[i] = month - 1 == i;
                          }
                          calendarGet("$year", "$month", partOfDay);
                          debugPrint(partMonth.toString());
                        });
                      },
                      onDaySelected: (selectedDay, focusedDay) async {
                        print(" salom salom    $selectedDay");
                        for (var element in _selectedDays) {
                          if (selectedDay == element.time) {
                            id = element.id;
                          }
                        }
                        print("hello fam   $id");
                        if (_selectedDays
                            .map((e) => e.time)
                            // ignore: unnecessary_null_comparison
                            .where((element) => element != null)
                            .cast<DateTime>()
                            .toList()
                            .contains(selectedDay)) {
                          calendarDayGet().then(
                            (value) {
                              OldBronDialog(
                                  context,
                                  selectedDay.month,
                                  selectedDay.day,
                                  nameController,
                                  phoneController,
                                  secondPhoneController,
                                  paidPriceController,
                                  addressController,
                                  otherController,
                                  () {

                                  }, () {
                                calendarDayDelete();
                              });
                            },
                          );
                        } else {
                          NewBronDialog(
                              context,
                              selectedDay.month,
                              selectedDay.day,
                              nameController,
                              phoneController,
                              secondPhoneController,
                              paidPriceController,
                              addressController,
                              otherController, () {
                            calendarDaySet(
                                selectedDay.toString(),
                                1,
                                "100",
                                paidPriceController.text.toString(),
                                "1",
                                phoneController.text.toString(),
                                secondPhoneController.text.toString(),
                                nameController.text.toString(),
                                addressController.text.toString(),
                                otherController.text.toString(),
                                partOfDay,
                                "deleted",
                                false);
                          });
                        }
                      },
                      focusedDay: DateTime.utc(year, month, day),
                      selectedDays:
                          // ignore: unnecessary_null_comparison
                          _selectedDays
                              .map((e) => e.time)
                              // ignore: unnecessary_null_comparison
                              .where((element) => element != null)
                              .cast<DateTime>()
                              .toList()),
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
                                // partDay[0] = !partDay[0];
                                partDay[0] = true;
                                partDay[1] = false;
                                partDay[2] = false;
                                debugPrint(partDay.toString());
                              });
                              calendarGet("$year", "$month", partOfDays[0]);
                              partOfDay = partOfDays[0];
                              setState(() {
                                _selectedDays.clear();
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
                              // partDay[1] = !partDay[1];
                              partDay[1] = true;
                              partDay[0] = false;
                              partDay[2] = false;
                              debugPrint(partDay.toString());
                            });
                            calendarGet("$year", "$month", partOfDays[1]);
                            partOfDay = partOfDays[1];
                            setState(() {
                              _selectedDays.clear();
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
                                // partDay[2] = !partDay[2];
                                partDay[2] = true;
                                partDay[1] = false;
                                partDay[0] = false;
                                debugPrint(partDay.toString());
                              });
                              calendarGet("$year", "$month", partOfDays[2]);
                              partOfDay = partOfDays[2];
                              setState(() {
                                _selectedDays.clear();
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
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 0 == i;
                                }
                              });
                              month = 1;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[0],
                            radius: 40,
                            select: partMonth[0]),
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 1 == i;
                                }
                              });
                              month = 2;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[1],
                            radius: 40,
                            select: partMonth[1]),
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 2 == i;
                                }
                              });
                              month = 3;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[2],
                            radius: 40,
                            select: partMonth[2]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 3 == i;
                                }
                              });
                              month = 4;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[3],
                            radius: 40,
                            select: partMonth[3]),
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 4 == i;
                                }
                              });
                              month = 5;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[4],
                            radius: 40,
                            select: partMonth[4]),
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 5 == i;
                                }
                              });
                              month = 6;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[5],
                            radius: 40,
                            select: partMonth[5]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 6 == i;
                                }
                              });
                              month = 7;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[6],
                            radius: 40,
                            select: partMonth[6]),
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 7 == i;
                                }
                              });
                              month = 8;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[7],
                            radius: 40,
                            select: partMonth[7]),
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 8 == i;
                                }
                              });
                              month = 9;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[8],
                            radius: 40,
                            select: partMonth[8]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 9 == i;
                                }
                              });
                              month = 10;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[9],
                            radius: 40,
                            select: partMonth[9]),
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 10 == i;
                                }
                              });
                              month = 11;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[10],
                            radius: 40,
                            select: partMonth[10]),
                        MonthElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDays;
                                for (int i = 0; i < partMonth.length; i++) {
                                  partMonth[i] = 11 == i;
                                }
                              });
                              month = 12;
                              calendarGet("$year", "$month", partOfDay);
                            },
                            text: months[11],
                            radius: 40,
                            select: partMonth[11]),
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

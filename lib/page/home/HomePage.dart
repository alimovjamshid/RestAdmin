import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/home/widgets/AboutDayPart.dart';
import 'package:restadmin/page/home/widgets/CustomCalendarDialog.dart';
import 'package:restadmin/page/home/widgets/CustomExpanceDialog.dart';
import 'package:restadmin/page/home/widgets/CustomELevetedButton.dart';
import 'package:restadmin/page/home/widgets/CustomIconButton.dart';
import 'package:restadmin/page/home/widgets/CustomText.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

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
                textColor: Colors.white,
                text: "Tahlil",
                borderRadius: 20,
                onPressed: () {},
                buttonHeight: 40,
                buttonWidth: 120,
                textSize: 16,
                color: colorGreen3,
              ),
              CustomElevatedButton(
                textColor: Colors.white,
                text: "Harajatlar",
                borderRadius: 20,
                color: colorGreen3,
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
                  CustomCalendarDialog(
                    context,
                    (value) {
                      setState(() {
                        selectYear = value as String;
                        year = int.parse(selectYear);
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
              const EdgeInsets.only(top: 210, left: 20, right: 20, bottom: 30),
          width: width,
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          child: Stack(children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 50, bottom: 5),
                child: Image.asset("assets/eat.png", width: 130),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                      bottomRight: Radius.circular(6))),
                            ),
                            child: Center(
                                child: Text("Bahor Restaurant",
                                    style: TextStyle(color: Colors.white))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$day-${months[month - 1]}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      CustomText(text: "Tongi", circleColor: colorGreen),
                      AboutDayPart(),
                      Container(
                        color: colorView,
                        height: 1,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(text: "Kunduzgi", circleColor: colorBlue),
                      AboutDayPart(),
                      Container(
                        color: colorView,
                        height: 1,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(text: "Kechki", circleColor: colorPink),
                      AboutDayPart(),
                      Container(
                        color: colorView,
                        height: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          onPressed: () {},
                          imageIcon: "assets/lefta.png",
                          height: 30,
                          width: 50,
                          borderRadius: 15,
                        ),
                        CustomIconButton(
                          onPressed: () {
                            debugPrint("right");
                          },
                          imageIcon: "assets/righta.png",
                          height: 30,
                          width: 50,
                          borderRadius: 15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

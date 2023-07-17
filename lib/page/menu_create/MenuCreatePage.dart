import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/bron/widgets/CustomAppBar.dart';

import '../home/widgets/CustomCalendarDialog.dart';
import '../home/widgets/CustomIconButton.dart';

class MenuCreatePage extends StatelessWidget {
  const MenuCreatePage({super.key});

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
                  CustomAppBar(text: "Menu yaratish"),
                  SizedBox(height: 5,),
                  Text("Standart menu yaratish",style: TextStyle(fontSize: 16),),
                  SizedBox(height: 20,),
                  Container(
                    height: 260,
                    width: width,
                    child: Stack(
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/menu.png"),
                              fit: BoxFit.none
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 50,
                                offset: Offset(0, 20),
                                spreadRadius: 0,
                              )
                            ]
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft: Radius.circular(6))
                                  ),
                                  color: colorGreen2
                                ),
                                child: Center(child: Text("Oddiy menu",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
                              ),
                            ),
                            SizedBox(height: 40,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text("1 taom - mastava",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text("2 taom - kabob",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(height: 50,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text("1 kishiga 50 ming menu",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                            ),
                          ],
                        )
                      ],
                    ),
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

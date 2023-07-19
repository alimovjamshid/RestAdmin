import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/bron/widgets/CustomAppBar.dart';
import 'package:restadmin/page/home/widgets/CustomELevetedButton.dart';
import 'package:restadmin/page/menu_create/widgets/FoodName.dart';
import 'package:restadmin/page/menu_create/widgets/FoodSelect.dart';
import 'package:restadmin/page/menu_create/widgets/MeetSelect.dart';
import 'package:restadmin/page/menu_create/widgets/SelectMenu.dart';

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
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomAppBar(text: "Menu yaratish"),
                      SizedBox(height: 5,),
                      Text("Standart menu yaratish",style: TextStyle(fontSize: 16),),
                      SizedBox(height: 20,),
                      SelectMenu(width: width,label: "Oddiy menu",food1: "mastava",food2: "kabob",foodPerson: "50",imageAssets: "assets/menu.png"),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevatedButton(text: "bekor qilish", onPressed: (){}, borderRadius: 6, color: colorGreen1, textColor: Colors.white,buttonHeight: 30,buttonWidth: 130,),
                          CustomElevatedButton(text: "Tahrirlash", onPressed: (){}, borderRadius: 6, color: colorGreen2, textColor: Colors.white,buttonHeight: 30,buttonWidth: 130,),
                        ],
                      ),
                      SizedBox(height: 30,),
                      SelectMenu(width: width,label: "Premium menu",food1: "mastava",food2: "kabob",foodPerson: "80",imageAssets: "assets/menuPremium.png"),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevatedButton(text: "bekor qilish", onPressed: (){}, borderRadius: 6, color: colorGreen1, textColor: Colors.white,buttonHeight: 30,buttonWidth: 130,),
                          CustomElevatedButton(text: "Tahrirlash", onPressed: (){}, borderRadius: 6, color: colorGreen2, textColor: Colors.white,buttonHeight: 30,buttonWidth: 130,),
                        ],
                      ),
                      SizedBox(height: 5,),
                      IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/addCircle.png")),color: colorGreen2,iconSize: 35),
                    ],
                  ),
                  Text("Taom yaratish",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  Container(
                    height: 30,
                    width: width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft: Radius.circular(6))
                      ),
                      color: colorGreen2,
                    ),
                    child: Center(child: Text("1 chi Taom nomi",style: TextStyle(fontSize: 18))),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1,color: colorGreen2),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6))
                      )
                    ),
                    child: Column(
                      children: [
                        FoodName(width: width,name: "Nomi",price: "Narxi",person: "Odamlar soni"),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 8,),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 8,),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 8,),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 8,),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomElevatedButton(text: "+ Taom qo'shish", onPressed: (){}, borderRadius: 6, color: colorGreen2, textColor: Colors.white,buttonWidth: 140),
                            CustomElevatedButton(text: "Bekor qilish", onPressed: (){}, borderRadius: 6, color: colorGreen2, textColor: Colors.white,buttonWidth: 140,)
                          ],
                        ),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 30,
                    width: width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft: Radius.circular(6))
                      ),
                      color: colorGreen2,
                    ),
                    child: Center(child: Text("2 chi Taom nomi",style: TextStyle(fontSize: 18))),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1,color: colorGreen2),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6))
                        )
                    ),
                    child: Column(
                      children: [
                        FoodName(width: width,name: "Nomi",price: "Narxi",person: "Odamlar soni"),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 8,),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 8,),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 8,),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 8,),
                        FoodSelect(width: width,name: "Mastava",price: "15 000",person: "1ta",onPressed: (){},),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomElevatedButton(text: "+ Taom qo'shish", onPressed: (){}, borderRadius: 6, color: colorGreen2, textColor: Colors.white,buttonWidth: 140),
                            CustomElevatedButton(text: "Bekor qilish", onPressed: (){}, borderRadius: 6, color: colorGreen2, textColor: Colors.white,buttonWidth: 140,)
                          ],
                        ),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/addCircle.png")),color: colorGreen2,iconSize: 35),
                  Text("Taom yaratish",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Container(
                    height: 55,
                    width: width,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(6),topLeft: Radius.circular(6))
                      ),
                      color: colorGreen3,
                    ),
                    child: Stack(
                      children: [
                        Center(child: Text("Go'shtli assorti",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("1 ta stol uchun",style: TextStyle(color: Colors.white,fontSize: 14)),
                          ),
                        )
                      ],
                    )
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        ),
                        color: colorGreen1
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: width*0.05,),
                          Text("Nomi",style: TextStyle(color: Colors.white,fontSize: 16)),
                          SizedBox(width: width * 0.3,),
                          Text("Miqdori",style: TextStyle(fontSize: 16,color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 10,),
                  MeetSelect(width: width, name: "Qazi", weight: "400gr", onPressed: (){}),
                  SizedBox(height: 8,),
                  MeetSelect(width: width, name: "Kalbasa", weight: "400gr", onPressed: (){}),
                  SizedBox(height: 8,),
                  MeetSelect(width: width, name: "Sir", weight: "400gr", onPressed: (){}),
                  SizedBox(height: 8,),
                  MeetSelect(width: width, name: "Mol go'shti", weight: "400gr", onPressed: (){}),
                  SizedBox(height: 8,),
                  MeetSelect(width: width, name: "Qo'y go'shti", weight: "400gr", onPressed: (){}),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(width: width * 0.5,child: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/addCircle.png"),color: colorGreen2,size: 30,))),
                      ),
                      CustomElevatedButton(text: "Bekor qilish", onPressed: (){}, borderRadius: 6, color: colorGreen2, textColor: Colors.white),
                      SizedBox(width: 8,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Yangi kategoriya qo'shish"),
                  IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/addCircle.png"),size: 40,color: colorGreen2,)),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


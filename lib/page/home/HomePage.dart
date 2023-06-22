import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/page/home/widgets/CustomELevetedButton.dart';
import 'package:restadmin/page/home/widgets/CustomIconButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Column(
          children: [
            Image.asset(
              "assets/img.png",
              height: 162,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 30
              ),
              height: 450,
              width: 320,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
              ),
              child: Column(
                children: [
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 143
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                text: "Tahlil",
                onPressed: () {},
                buttonHeight: 40,
                buttonWidth: 120,
                textSize: 16,
              ),
              CustomElevatedButton(
                text: "Harajatlar",
                onPressed: () {},
                buttonHeight: 40,
                buttonWidth: 120,
                textSize: 16,
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 38,
            left: 24,
            right: 24
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(onPressed: (){},imageIcon: "assets/calendar.png",height: 35,width: 35,borderRadius: 7,),
              CustomIconButton(onPressed: (){},imageIcon: "assets/settings.png",height: 35,width: 35,borderRadius: 7,)
            ],
          ),
        )
      ]),
    );
  }
}


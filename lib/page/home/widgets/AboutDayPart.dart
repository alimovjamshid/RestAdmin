import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';
import '../../bron/widgets/OldTextField.dart';

class AboutDayPart extends StatelessWidget {
  const AboutDayPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      collapsed: Container(
        color: colorText,
        height: 0,
      ),
      expanded: Column(
        children: [
          OldTextField(text: "Tel raqam", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Qo'shimcha raqam", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Manzil", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Oldindan to'lov", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "To'langan summa", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Offitsiantlar soni", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Mehmonlar soni", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Boshlanish soni", width: 165, textColor: colorText),
          SizedBox(height: 30,),

          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Tanlangan menu",style: TextStyle(fontSize: 16,color: Colors.black)))),

          SizedBox(height: 20,),
          OldTextField(text: "Birinchi taom", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Ikkinchi taom", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Standart menu", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Bozorlik ro'yxati", width: 165, textColor: colorText),
          SizedBox(height: 30,),

          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Tanlangan menu",style: TextStyle(fontSize: 16,color: Colors.black)))),

          SizedBox(height: 20,),
          OldTextField(text: "Sveta-muzika", width: 165, textColor: colorText),
          SizedBox(height: 10,),
          OldTextField(text: "Qo'shimcha offitsiantlar", width: 165, textColor: colorText),

          SizedBox(height: 30,)
        ],
      ),
      header: Text("Alimov Shuxrat -07:00/09:00-Ayollar bazmi",textAlign: TextAlign.center),
      theme: ExpandableThemeData(
          hasIcon: true,
          iconColor: colorGreen3,
          iconSize: 36,
          tapHeaderToExpand: true,
          headerAlignment: ExpandablePanelHeaderAlignment.center
      ),
    );
  }
}


import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class CustomExpandablePanel extends StatelessWidget {
  const CustomExpandablePanel({
    super.key,
    required this.ischecket,
    required this.expandableController, required this.onPressed, required this.onChanged, required this.textColor, required this.background, required this.onPressedColor, required this.label, required this.personMoney, required this.expanded, required this.checketColor,
  });

  final bool ischecket;
  final ExpandableController expandableController;
  final VoidCallback onPressed;
  final Function(bool?) onChanged;
  final Color textColor;
  final Color background;
  final Color onPressedColor;
  final String label;
  final String personMoney;
  final Widget expanded;
  final Color checketColor;


  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: expandableController,
      collapsed: Container(
        height: 0,
      ),
      expanded: expanded,
      header: Container(
        height: 150,
        decoration: ShapeDecoration(
          color: background,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: colorGreen2,width: 3)
            )
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(label,style: TextStyle(color: textColor)),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: ischecket,
                  onChanged: onChanged,
                  side: BorderSide(color: textColor,width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  activeColor: checketColor,
                  autofocus: true,
                  checkColor: background,
                  fillColor: MaterialStateColor.resolveWith((states) {
                    return textColor;
                  }),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20,left: 15),
                child: Text(personMoney,style: TextStyle(color: textColor,fontSize: 18)),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 14),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                  ),
                  child: Text("Ko'proq ko'rish",style: TextStyle(fontSize: 16,color: onPressedColor)),
                  onPressed: onPressed
                ),
              ),
            )
          ],
        ),
      ),
      theme: ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.bottom,
          hasIcon: false,
          tapBodyToCollapse: true,
          tapHeaderToExpand: false,
          tapBodyToExpand: false,
          useInkWell: true
      ),
    );
  }
}

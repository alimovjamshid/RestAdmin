import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class SelectFood extends StatelessWidget {
  const SelectFood({
    super.key, required this.expandableController, required this.label, required this.expanded, required this.onPressed,
  });

  final ExpandableController expandableController;
  final String label;
  final Widget expanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: expandableController,
      collapsed: Container(height: 0,),
      expanded: expanded,
      header: Container(
        height: 50,
        decoration: BoxDecoration(
          color: colorGreen2,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,style: TextStyle(color: Colors.white,fontSize: 20)),
              IconButton(
                  onPressed: onPressed,
                  icon: ImageIcon(AssetImage("assets/arrow.png"),color: Colors.white,size: 35,)
              )
            ],
          ),
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

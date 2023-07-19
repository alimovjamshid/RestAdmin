import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/home/widgets/DropDown.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../bron/widgets/CustomCalendar.dart';


void CustomCalendarDialog(BuildContext context,Function(DateTime) onPressedDay,Function(String?) onPressedDropdown){
  showDialog(
    barrierDismissible: true,
    useSafeArea: true,
    useRootNavigator: true,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Dropdown(onPressed: onPressedDropdown,selectValue: selectYear,list: listYears),

            CustomCalendar(onPressed: onPressedDay, focusedDay: DateTime.utc(year,month,day), selectedDays: selectedDays),
          ],
        ),
      );
    },
  );
}
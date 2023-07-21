import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/page/bron/widgets/NewBronDialog.dart';
import 'package:restadmin/page/bron/widgets/OldBronDialog.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../Utils.dart';

class CustomCalendar extends StatelessWidget {
   CustomCalendar({
    super.key,
    required DateTime focusedDay,
    required Set<DateTime> selectedDays, required this.onPressed, required this.onDaySelected,
  }) : _focusedDay = focusedDay, _selectedDays = selectedDays;

   DateTime _focusedDay;
  final Set<DateTime> _selectedDays;
  final Function(DateTime) onPressed;
  final Function(DateTime,DateTime) onDaySelected;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      availableGestures: AvailableGestures.none,
      rowHeight: 40,
      locale: 'uz_UZ',
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: colorGreenLight,
          borderRadius: BorderRadius.circular(6),
          shape: BoxShape.rectangle,
        ),
        defaultTextStyle: TextStyle(
            color: Colors.black
        ),
        todayTextStyle: TextStyle(
            color: Colors.black
        ),
        weekendTextStyle: TextStyle(
            color: Colors.black
        ),
        outsideDaysVisible: true,
        selectedDecoration: BoxDecoration(
          color: colorGreen3,
          borderRadius: BorderRadius.circular(6),
          shape: BoxShape.rectangle,
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
        ),
        outsideDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6)
        ),
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(
              color: colorPink
          )
      ),
      headerVisible: true,
      calendarFormat: CalendarFormat.month,
      headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonShowsNext: true,
          formatButtonVisible: false,
          rightChevronVisible: true,
          leftChevronVisible: true,
          titleTextFormatter: (date, locale) {
            return months[date.month-1];
          },
          leftChevronIcon: ImageIcon(AssetImage("assets/left.png"),color: colorView,size: 35),
          rightChevronIcon: ImageIcon(AssetImage("assets/right.png"),color: colorView,size: 35,),
          headerPadding: EdgeInsets.symmetric(vertical: 0),
          titleTextStyle: TextStyle(
              color: colorGreen3,
              fontSize: 20
          ),
      ),
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2020,01,01),
      lastDay: DateTime.utc(2030,12,31),
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      onPageChanged: onPressed,
      selectedDayPredicate: (day) => _selectedDays.contains(day),
      onDaySelected: onDaySelected
          // (selectedDay, focusedDay) {
        // if (_selectedDays.contains(selectedDay)) {
        //   OldBronDialog(context, selectedDay.month, selectedDay.day);
        // } else {
        //   NewBronDialog(context,selectedDay.month,selectedDay.day);
        // }
      // },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/page/bron/widgets/NewBronDialog.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../Utils.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({
    super.key,
    required DateTime focusedDay,
    required Set<DateTime> selectedDays,
  }) : _focusedDay = focusedDay, _selectedDays = selectedDays;

  final DateTime _focusedDay;
  final Set<DateTime> _selectedDays;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      availableGestures: AvailableGestures.none,
      rowHeight: 40,
      locale: 'uz_UZ',
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Color(0xFF95DBD8),
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
          color: const Color(0xFF0B6561),
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
      holidayPredicate: (day) {
        return day == DateTime(2023,07,15);
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(
              color: Color(0xFFC57B7B)
          )
      ),
      headerVisible: true,
      calendarFormat: CalendarFormat.month,
      headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonShowsNext: false,
          formatButtonVisible: false,
          rightChevronVisible: true,
          leftChevronVisible: true,
          titleTextFormatter: (date, locale) {
            return month[date.month-1];
          },
          leftChevronIcon: ImageIcon(AssetImage("assets/left.png"),color: Color(0xFFB6C9C8),size: 35),
          rightChevronIcon: ImageIcon(AssetImage("assets/right.png"),color: Color(0xFFB6C9C8),size: 35,),
          headerPadding: EdgeInsets.symmetric(vertical: 0),
          titleTextStyle: TextStyle(
              color: Color(0xFF0B6561),
              fontSize: 20
          )
      ),
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2020,01,01),
      lastDay: DateTime.utc(2030,12,31),
      rangeSelectionMode: RangeSelectionMode.toggledOff,
      selectedDayPredicate: (day) => _selectedDays.contains(day),
      onDaySelected: (selectedDay, focusedDay) {
        if (_selectedDays.contains(selectedDay)) {
          debugPrint("oldin belgilangan");
        } else {
          debugPrint("qo'shildi");
          NewBronDialog(context);
        }
      },
    );
  }
}

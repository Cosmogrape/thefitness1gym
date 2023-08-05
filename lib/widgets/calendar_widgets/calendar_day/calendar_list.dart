import 'package:flutter/material.dart';

import 'calendar_day_header.dart';
import 'calendar_item.dart';
import 'calendar_month_header.dart';

/// A list of [CalendarItem]s with auto generated [CalendarDayHeader]s for each day
@immutable
class CalendarList extends StatelessWidget {
  const CalendarList({
    super.key,
    required this.items,
  });

  final List<CalendarItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text("No items"));
    }

    List<CalendarItem> itemsSorted = [...items];
    itemsSorted.sort((a, b) => a.date.compareTo(b.date));

    List<Widget> children = [];
    int? year;
    int? month;
    int? day;
    for (int i = 0; i < itemsSorted.length; i++) {
      final item = itemsSorted[i];
      final notThisYear = year != item.date.year;
      final notThisMonth = notThisYear || month != item.date.month;
      final notThisDay = notThisMonth || day != item.date.day;
      if (notThisMonth) {
        month = item.date.month;
        year = item.date.year;
        children.add(CalendarMonthHeader(item.date));
      }
      if (notThisDay) {
        day = item.date.day;
        children.add(CalendarDayHeader(item.date));
      }
      children.add(item);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/global/date/date_extension.dart';

class CalendarDayHeader extends StatelessWidget {
  const CalendarDayHeader(this.date, {super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isToday = date.isToday;
    final color = isToday ? theme.colorScheme.onBackground : theme.colorScheme.onSurface;
    final colorSecondary = color.withOpacity(isToday ? .8 : .5);

    String day = date.format("l"); // Monday
    if (isToday) {
      day += " (Today)";
    } else if (date.isTomorrow) {
      day += " (Tomorrow)";
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: PredefinedPadding.regular),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            date.format("d"), // 09
            style: theme.textTheme.headlineLarge!.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: PredefinedPadding.regular),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: PredefinedPadding.small),
                  child: Container(height: PredefinedPadding.xTiny, color: colorSecondary),
                ),
                Text(
                  day,
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: colorSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

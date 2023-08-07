import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';
import 'package:thefitness1gym/global/date/date_extension.dart';

class CalendarMonthHeader extends StatelessWidget {
  const CalendarMonthHeader(this.date, {super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isThisMonth = date.isThisMonth;
    final color = theme.colorScheme.primary;
    final colorSecondary = isThisMonth ? color.withOpacity(.2) : theme.colorScheme.surface;

    final line = Expanded(
      child: Divider(
        color: colorSecondary,
        thickness: PredefinedSize.tiny,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PredefinedSize.regular),
      child: Row(
        children: [
          line,
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: PredefinedSize.tiny,
              horizontal: PredefinedSize.regular,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(PredefinedSize.regular),
              color: colorSecondary,
            ),
            child: Text(
              date.format(date.isThisYear ? "F" : "F, Y"),
              style: theme.textTheme.bodyLarge!.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          line,
        ],
      ),
    );
  }
}

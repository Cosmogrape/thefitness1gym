import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({
    super.key,
    required this.text,
    required this.date,
  });

  final String text;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: PredefinedSize.regular),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date.format("g:i A"),
            style: theme.textTheme.labelMedium!.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text, //? 1:30 PM
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}

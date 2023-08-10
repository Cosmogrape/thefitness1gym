import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';

class UpcomingItem extends StatelessWidget {
  const UpcomingItem({
    required this.text,
    required this.date,
    super.key,
  });

  final String text;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.regular, vertical: PredefinedPadding.small),
      color: Colors.black.withOpacity(.2),
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date.format("d/m/y - h:m"),
            style: theme.textTheme.labelSmall!.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            style: theme.textTheme.labelMedium!.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

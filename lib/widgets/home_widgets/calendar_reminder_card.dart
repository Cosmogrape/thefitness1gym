import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';

import 'home_card.dart';

class CalendarReminderCard extends StatelessWidget {
  const CalendarReminderCard({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return HomeCard(
      heroTag: "calendar_reminder",
      onTap: onTap,
      color: Colors.green.shade900.withOpacity(.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.big, vertical: PredefinedPadding.medium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(FontAwesomeIcons.calendar, color: Colors.green.shade200),
            //? not using Padding in order to support LTR and RTL languages at the same time
            const SizedBox(width: PredefinedPadding.medium),
            Text(
              text,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.green.shade200,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

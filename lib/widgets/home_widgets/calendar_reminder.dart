import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';

import 'home_card.dart';

class CalendarReminder extends StatelessWidget {
  const CalendarReminder({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PredefinedSize.big, vertical: PredefinedSize.medium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(FontAwesomeIcons.calendar, color: Colors.green.shade200),
            const SizedBox(width: PredefinedSize.medium),
            Text(
              text,
              style: theme.textTheme.bodyLarge!.copyWith(
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

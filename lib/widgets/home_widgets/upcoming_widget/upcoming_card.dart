import 'package:flutter/material.dart';
import 'package:thefitness1gym/pages/calendar_page.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/home_widgets/home_card.dart';

import 'upcoming_item.dart';

class UpcomingCard extends StatefulWidget {
  const UpcomingCard({super.key});

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const spacerAround = SizedBox(height: PredefinedPadding.small);
    const spacer = SizedBox(height: PredefinedPadding.tiny);

    return SizedBox(
      width: 220,
      child: HomeCard(
        heroTag: "calendar",
        color: const Color(0xFF828DCA),
        onTap: () => Navigator.of(context).push(CalendarPage.route),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: PredefinedPadding.regular),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.medium),
                child: Text(
                  "Upcoming",
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              spacerAround,
              UpcomingItem(
                date: DateTime.now().add(const Duration(days: 2, hours: 3)),
                text: "Aerobatics with Osman",
              ),
              spacer,
              UpcomingItem(
                date: DateTime.now().add(const Duration(days: 1, hours: 12)),
                text: "Old folk with Mariam",
              ),
              spacer,
              UpcomingItem(
                date: DateTime.now().add(const Duration(days: 3, hours: 6)),
                text: "Gymnastic with Shiko at the parking lot",
              ),
              spacerAround,
              Center(
                child: Text(
                  "View all…",
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

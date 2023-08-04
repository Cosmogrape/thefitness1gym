import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';
import 'package:thefitness1gym/pages/calendar_page.dart';
import 'package:thefitness1gym/widgets/home_widgets/home_card.dart';

import 'upcoming_item.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const spacer = SizedBox(height: 1);

    return HomeCard(
      heroTag: "calendar",
      color: const Color(0xFF828DCA),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CalendarPage(),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: PredefinedSize.padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PredefinedSize.paddingMedium),
              child: Text(
                "Upcoming",
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 18, // because Medium is small and Large is big, need the middle size
                  color: theme.colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: PredefinedSize.padding),
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
            SizedBox(height: PredefinedSize.padding),
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
    );
  }
}

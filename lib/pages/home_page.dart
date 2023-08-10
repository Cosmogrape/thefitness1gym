import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/pages/profile_page.dart';
import 'package:thefitness1gym/widgets/home_widgets/calendar_reminder.dart';
import 'package:thefitness1gym/widgets/home_widgets/home_card.dart';
import 'package:thefitness1gym/widgets/home_widgets/overview_widget/overview.dart';
import 'package:thefitness1gym/widgets/home_widgets/upcoming_widget/upcoming.dart';
import 'package:thefitness1gym/widgets/home_widgets/your_membership.dart';

import '../widgets/headline_text.dart';
import 'locations_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // key: _scaffoldKey,
      // endDrawer: const UserMenu(),
      body: Padding(
        padding: const EdgeInsets.all(PredefinedPadding.regular),
        child: ListView(
          //? not an app bar because this is more flexible
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: PredefinedPadding.regular,
                right: PredefinedPadding.regular,
                top: PredefinedPadding.small,
                bottom: PredefinedPadding.regular,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeadlineText(),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.user),
                    color: theme.colorScheme.onBackground,
                    highlightColor: theme.colorScheme.primary,
                    onPressed: () => Navigator.of(context).push(ProfilePage.route),
                  ),
                ],
              ),
            ),
            CalendarReminder(
              text: "Aerobatics with Osman in 42m",
              onTap: () {},
            ),
            const SizedBox(height: PredefinedPadding.regular),
            const Row(children: [Overview(), Upcoming()]),
            const YourMembership(),
            HomeCard(
              onTap: () => Navigator.of(context).push(LocationsPage.route),
              child: Container(
                height: 100,
                child: Text("Gym Locations"),
              ),
            ),
            // const WorkoutPlans(),
          ],
        ),
      ),
    );
  }
}

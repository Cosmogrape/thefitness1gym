import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/home_widgets/calendar_reminder.dart';
import 'package:thefitness1gym/widgets/home_widgets/overview_widget/overview.dart';
import 'package:thefitness1gym/widgets/home_widgets/upcoming_widget/upcoming.dart';

import '../widgets/headline_text.dart';
import '../widgets/user_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const UserMenu(),
      body: Padding(
        padding: const EdgeInsets.all(PredefinedPadding.regular),
        child: ListView(
          //? not an app bar because this is more flexible
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadlineText(),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.user),
                  color: theme.colorScheme.onBackground,
                  highlightColor: theme.colorScheme.primary,
                  onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                ),
              ],
            ),
            const SizedBox(height: PredefinedPadding.big),
            CalendarReminder(
              text: "Aerobatics with Osman in 42m",
              onTap: () {},
            ),
            const SizedBox(height: PredefinedPadding.regular),
            const Row(children: [Overview(), Upcoming()]),
          ],
        ),
      ),
    );
  }
}

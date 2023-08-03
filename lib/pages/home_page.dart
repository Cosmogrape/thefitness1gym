import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/widgets/calendar_reminder.dart';

import '../assets/values/predefined_size.dart';
import '../widgets/headline_text.dart';
import '../widgets/overview_widget/overview.dart';
import '../widgets/user_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      //? Intentionally empty app bar:
      //? Gives the screen an opening/closing animation
      //? Controls status bar color
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: theme.colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(PredefinedSize.padding),
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
            SizedBox(height: PredefinedSize.paddingBig),
            CalendarReminder(
              text: "Aerobatics with Osman in 42m",
              onTap: () {},
            ),
            SizedBox(height: PredefinedSize.padding),
            const Row(children: [
              Overview(),
              Overview(),
            ]),
          ],
        ),
      ),
    );
  }
}

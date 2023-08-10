import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/home_widgets/calendar_reminder.dart';
import 'package:thefitness1gym/widgets/home_widgets/home_card.dart';
import 'package:thefitness1gym/widgets/home_widgets/overview_widget/overview.dart';
import 'package:thefitness1gym/widgets/home_widgets/upcoming_widget/upcoming.dart';
import 'package:thefitness1gym/widgets/home_widgets/your_membership.dart';

import '../widgets/headline_text.dart';
import 'locations_page.dart';
import 'profile_page.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.background,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: theme.colorScheme.background,
          systemNavigationBarColor: theme.colorScheme.background,
        ),
        // centerTitle: true,
        title: const HeadlineText(),
        actions: [
          InkWell(
            splashColor: theme.colorScheme.primary,
            highlightColor: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(50),
            onTap: () => Navigator.of(context).push(ProfilePage.route),
            child: const Padding(
              padding: EdgeInsets.all(PredefinedPadding.tiny),
              child: Hero(
                tag: "pfp",
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage("lib/assets/images/pfp.png"),
                ),
              ),
            ),
          ),
          const SizedBox(width: PredefinedPadding.medium),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(PredefinedPadding.regular),
        child: ListView(
          //? not an app bar because this is more flexible
          children: [
            CalendarReminder(
              text: "Aerobatics with Osman in 42m",
              onTap: () {},
            ),
            const YourMembership(),
            HomeCard(
              onTap: () => Navigator.of(context).push(LocationsPage.route),
              child: Container(
                height: 50,
                child: Text("Gym Locations"),
              ),
            ),
            const SizedBox(height: PredefinedPadding.regular),
            const Row(children: [Overview(), Upcoming()]),

            // const WorkoutPlans(),
          ],
        ),
      ),
    );
  }
}

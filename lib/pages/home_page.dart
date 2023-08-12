import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/global/widgets/mono_eased_gradient.dart';
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
  static const padding = PredefinedPadding.medium;

  /// this exists so horizontal lists go to the edge of the screen
  Padding _padded(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const padV = SizedBox(height: padding);
    const padH = SizedBox(width: padding);

    const double scrollerHeight = 230;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.background,
        title: const HeadlineText(),
        actions: [
          InkWell(
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
          padH,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          //? not an app bar because this is more flexible
          children: [
            _padded(const YourMembership()),
            _padded(CalendarReminder(
              text: "Aerobatics with Osman in 42m",
              onTap: () {},
            )),
            _padded(HomeCard(
              onTap: () => Navigator.of(context).push(LocationsPage.route),
              child: Container(
                height: 50,
                child: Text("Gym Locations"),
              ),
            )),
            padV,

            SizedBox(
              height: scrollerHeight,
              child: Stack(
                children: [
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: const [padH, Overview(), Upcoming(), padH],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: MonoEasedGradient(
                      width: padding * 2,
                      height: scrollerHeight,
                      color: theme.colorScheme.background,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: MonoEasedGradient(
                      width: padding * 2,
                      height: scrollerHeight,
                      color: theme.colorScheme.background,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ],
              ),
            ),

            // const WorkoutPlans(),
          ],
        ),
      ),
    );
  }
}

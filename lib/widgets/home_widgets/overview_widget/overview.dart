import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/home_widgets/overview_widget/overview_item.dart';

import '../home_card.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(PredefinedPadding.medium);

    const itemPadding = EdgeInsets.symmetric(
      horizontal: PredefinedPadding.regular,
      vertical: PredefinedPadding.regular * .7,
    );
    const spacer = SizedBox(height: 2);

    return HomeCard(
      heroTag: "overview",
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(PredefinedPadding.small),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: borderRadius,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OverviewItem(
                    textBig: "6",
                    text: 'days streak',
                    icon: FontAwesomeIcons.fire,
                    color: theme.colorScheme.primary,
                    backgroundColor: theme.colorScheme.background.withOpacity(.7),
                    padding: itemPadding,
                  ),
                  spacer,
                  OverviewItem(
                    textBig: "18",
                    text: "days workout",
                    icon: FontAwesomeIcons.handFist,
                    color: Colors.red.shade400,
                    padding: itemPadding,
                  ),
                  spacer,
                  OverviewItem(
                    textBig: "5",
                    text: "days rest",
                    icon: FontAwesomeIcons.moon,
                    color: Colors.blueGrey.shade200,
                    padding: itemPadding,
                  ),
                  spacer,
                  OverviewItem(
                    textBig: "4",
                    text: "events soon",
                    icon: FontAwesomeIcons.calendarCheck,
                    color: Colors.green.shade200,
                    padding: itemPadding,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: PredefinedPadding.small),
              child: Text(
                "More information…",
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
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

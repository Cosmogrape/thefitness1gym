import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';
import 'package:thefitness1gym/widgets/animated_tap.dart';
import 'package:thefitness1gym/widgets/overview_widget/overview_item.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: AnimatedTap(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PredefinedSize.radiusBig),
          ),
          color: theme.colorScheme.primary,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PredefinedSize.paddingMedium, vertical: PredefinedSize.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Overview",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 18,
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: PredefinedSize.padding),
                OverViewItem(
                  textBig: "14",
                  text: 'days streak',
                  icon: FontAwesomeIcons.fireFlameSimple,
                  color: theme.colorScheme.primaryContainer,
                  onTap: () {},
                ),
                SizedBox(height: PredefinedSize.padding / 2),
                OverViewItem(
                  textBig: "8",
                  text: 'days of workout',
                  icon: FontAwesomeIcons.dumbbell,
                  color: Colors.red.shade400,
                  onTap: () {},
                ),
                SizedBox(height: PredefinedSize.padding / 2),
                OverViewItem(
                  textBig: "3",
                  text: 'days of rest',
                  icon: FontAwesomeIcons.moon,
                  color: Colors.blueGrey.shade300,
                  onTap: () {},
                ),
                SizedBox(height: PredefinedSize.padding),
                Text(
                  "View more…",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

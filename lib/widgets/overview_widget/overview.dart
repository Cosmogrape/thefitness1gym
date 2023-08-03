import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';
import 'package:thefitness1gym/global/widgets/animated_tap.dart';
import 'package:thefitness1gym/widgets/overview_widget/overview_item.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  final borderRadius = BorderRadius.circular(PredefinedSize.radiusMedium);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final itemPadding = EdgeInsets.symmetric(
      horizontal: PredefinedSize.padding,
      vertical: PredefinedSize.padding * .7,
    );
    const spacer = SizedBox(height: 2);

    return Expanded(
      child: AnimatedTap(
        tapDownOpacity: .6,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Scaffold(body: Center(child: Text("Overview"))),
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          color: theme.colorScheme.primary,
          child: Padding(
            padding: EdgeInsets.all(PredefinedSize.paddingSmall),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(
                //   "Overview",
                //   style: theme.textTheme.titleMedium!.copyWith(
                //     fontSize: 18,
                //     color: theme.colorScheme.onPrimary,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: PredefinedSize.padding),
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
                        onTap: () {},
                      ),
                      spacer,
                      OverviewItem(
                        textBig: "18",
                        text: "days workout",
                        icon: FontAwesomeIcons.handFist,
                        color: Colors.red.shade400,
                        padding: itemPadding,
                        onTap: () {},
                      ),
                      spacer,
                      OverviewItem(
                        textBig: "5",
                        text: "days rest",
                        icon: FontAwesomeIcons.moon,
                        color: Colors.blueGrey.shade200,
                        padding: itemPadding,
                        onTap: () {},
                      ),
                      spacer,
                      OverviewItem(
                        textBig: "4",
                        text: "events soon",
                        icon: FontAwesomeIcons.calendarCheck,
                        color: Colors.green.shade200,
                        padding: itemPadding,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: PredefinedSize.paddingSmall),
                  child: Text(
                    "More information",
                    style: theme.textTheme.labelMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
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

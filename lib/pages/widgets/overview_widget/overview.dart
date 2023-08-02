import 'package:flutter/material.dart';
import 'package:thefitness1gym/pages/values/size.dart';

import '../animated_tap.dart';

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

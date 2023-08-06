import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/global/widgets/animated_tap.dart';

class YourMembership extends StatefulWidget {
  const YourMembership({super.key});

  @override
  State<YourMembership> createState() => _YourMembershipState();
}

class _YourMembershipState extends State<YourMembership> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    //? Not using HomeCard because of the masked image on the right
    return AnimatedTap(
      tapDownOpacity: .6,
      child: Hero(
        tag: "membership",
        child: Padding(
          padding: const EdgeInsets.all(PredefinedPadding.small),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(PredefinedPadding.medium),
            child: Stack(
              children: [
                Container(
                  color: theme.colorScheme.onBackground,
                  // onTap: () => Navigator.of(context).pushNamed("/membership"),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: PredefinedPadding.large,
                      horizontal: PredefinedPadding.big,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Your Membership",
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.background,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 40,
                  child: Transform(
                    transform: Matrix4.rotationZ(-pi / 6), //? -30° rotation
                    child: Image.asset(
                      "lib/assets/images/dumbbell_man.png",
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      width: 150,
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

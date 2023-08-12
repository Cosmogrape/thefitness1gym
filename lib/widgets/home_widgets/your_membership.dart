import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/home_widgets/home_card.dart';

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
    return HomeCard(
      heroTag: "membership",
      color: theme.colorScheme.onBackground,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(PredefinedPadding.medium),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double width = min(constraints.maxWidth, 1000); //! so max (infinity) doesnt work while 1000 works without overflow? wtf
            final double height = min(constraints.maxHeight, 72);
            return SizedBox(
              width: width,
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.big),
                      child: Text(
                        "Your Membership",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.background,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -150,
                    top: -60,
                    child: Transform(
                      transform: Matrix4.rotationZ(-pi / 6), //? -30° rotation
                      child: Image.asset(
                        "assets/images/dumbbell_man.png",
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        width: 150,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -10,
                    child: Transform(
                      transform: Matrix4.rotationZ(-pi / 6), //? -30° rotation
                      child: Image.asset(
                        "assets/images/dumbbell_man.png",
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        width: 120,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

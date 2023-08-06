import 'dart:math';

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/home_widgets/home_card.dart';

class YourMembership extends StatefulWidget {
  const YourMembership({super.key});

  @override
  State<YourMembership> createState() => _YourMembershipState();
}

class _YourMembershipState extends State<YourMembership> {
  bool showContent = false;

  void _resetAnimation() {
    showContent = false;
    Future.delayed(const Duration(milliseconds: 750), () {
      setState(() => showContent = true);
    });
  }

  @override
  void initState() {
    super.initState();
    _resetAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    //? Not using HomeCard because of the masked image on the right
    return HomeCard(
      heroTag: "membership",
      onTap: _resetAnimation,
      color: theme.colorScheme.onBackground,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(PredefinedPadding.medium),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: PredefinedPadding.large,
                horizontal: PredefinedPadding.big,
              ),
              child: Flexible(
                // width: PredefinedPadding.medium,
                child: AnimatedSizeAndFade.showHide(
                  show: showContent,
                  fadeDuration: const Duration(seconds: 1, milliseconds: 500),
                  sizeDuration: const Duration(seconds: 1),
                  fadeInCurve: Curves.easeInOut,
                  fadeOutCurve: Curves.easeInOut,
                  sizeCurve: Curves.easeInOut,
                  child: Text(
                    "Your Membership",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.background,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 40,
              child: Transform(
                transform: Matrix4.rotationZ(-pi / 6), //? -30° rotation
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  opacity: showContent ? 1 : 0,
                  child: Image.asset(
                    "lib/assets/images/dumbbell_man.png",
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/global/widgets/mono_eased_gradient.dart';
import 'package:thefitness1gym/pages/locations_page.dart';
import 'package:thefitness1gym/pages/packages_page.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/home_widgets/home_card.dart';

class YourMembershipCard extends StatefulWidget {
  const YourMembershipCard({super.key});

  @override
  State<YourMembershipCard> createState() => _YourMembershipCardState();
}

class _YourMembershipCardState extends State<YourMembershipCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle = theme.textTheme.displayMedium?.copyWith(
      shadows: [
        Shadow(
          offset: const Offset(0, 5),
          blurRadius: 20,
          color: theme.colorScheme.background.withOpacity(.75),
        ),
      ],
      fontWeight: FontWeight.w900,
      color: theme.colorScheme.onBackground,
    );
    final textStylePrimary = textStyle?.copyWith(
      color: theme.colorScheme.primary,
    );

    //? Not using HomeCard because of the masked image on the right
    return HomeCard(
      onTap: () => Navigator.of(context).push(PackagesPage.route),
      heroTag: "membership",
      color: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.surface,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double width = min(constraints.maxWidth, 2000); //! so max (infinity) doesnt work while 1000 works without overflow? wtf
          final double height = min(constraints.maxHeight, 380);
          return ClipRRect(
            borderRadius: BorderRadius.circular(PredefinedPadding.medium),
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Opacity(
                    opacity: .5,
                    child: Image.asset(
                      "assets/images/pullup_grayscale_zoomed.jpg",
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) return child;
                        return AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut,
                          child: child,
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container();
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: MonoEasedGradient(
                      height: height,
                      width: width,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PredefinedPadding.big,
                      vertical: PredefinedPadding.medium,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "GET IN SHAPE,", style: textStylePrimary),
                              TextSpan(text: "\nGET FIT,", style: textStyle),
                              TextSpan(text: "\nSTARTING TODAY.", style: textStylePrimary),
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: PredefinedPadding.big,
                                  vertical: PredefinedPadding.regular,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(PredefinedPadding.medium),
                                ),
                                // icon: const Icon(FontAwesomeIcons.circleArrowRight),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(FontAwesomeIcons.circleArrowRight, color: theme.colorScheme.onPrimary),
                                    const SizedBox(width: PredefinedPadding.regular),
                                    Text(
                                      "JOIN US NOW",
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        color: theme.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: PredefinedPadding.regular),
                              TextButton.icon(
                                onPressed: () => Navigator.of(context).push(LocationsPage.route),
                                style: TextButton.styleFrom(
                                  foregroundColor: theme.colorScheme.onSurface,
                                ),
                                icon: const Icon(FontAwesomeIcons.link, size: 18),
                                label: Text("Our branches", style: theme.textTheme.bodyLarge),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

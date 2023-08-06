import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_radius.dart';
import 'package:thefitness1gym/global/widgets/animated_tap.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    this.child,
    this.color,
    this.onTap,
    this.heroTag,
    super.key,
  });

  final Widget? child;
  final Color? color;
  final Function()? onTap;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(PredefinedRadius.medium);

    final card = Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      color: color ?? theme.colorScheme.surface,
      child: child,
    );

    return Expanded(
      child: AnimatedTap(
        tapDownOpacity: .6,
        onTap: onTap,
        child: heroTag == null
            ? card
            : Hero(
                tag: heroTag!,
                transitionOnUserGestures: true,
                child: card,
              ),
      ),
    );
  }
}

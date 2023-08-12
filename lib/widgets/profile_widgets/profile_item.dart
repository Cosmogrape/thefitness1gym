import 'package:flutter/material.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/global/color_extension.dart';
import 'package:thefitness1gym/global/widgets/expandable_panel.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.header,
    required this.body,
    this.color,
    this.icon,
    this.initiallyExpanded = false,
  });

  final Widget header;
  final Widget body;
  final Color? color;
  final IconData? icon;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const borderRadius = PredefinedPadding.medium;
    const headerPadding = EdgeInsets.all(PredefinedPadding.medium);
    const bodyPadding = EdgeInsets.symmetric(vertical: PredefinedPadding.regular, horizontal: PredefinedPadding.medium);
    const double iconSize = 24;
    final headerBackgroundColor = theme.colorScheme.surface;
    final bodyBackgroundColor = theme.colorScheme.surface.multiply(.5);
    return ExpandablePanel(
      initiallyExpanded: initiallyExpanded,
      useInkWell: true,
      borderRadius: borderRadius,
      color: color ?? theme.colorScheme.primary,
      iconSize: iconSize,
      headerPadding: headerPadding,
      bodyPadding: bodyPadding,
      headerBackgroundColor: headerBackgroundColor,
      bodyBackgroundColor: bodyBackgroundColor,
      icon: icon,
      header: header,
      body: body,
    );
  }
}

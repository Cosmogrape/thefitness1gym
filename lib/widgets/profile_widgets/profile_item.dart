import 'package:flutter/material.dart';
import 'package:thefitness1gym/global/color_extension.dart';
import 'package:thefitness1gym/global/widgets/expandable_panel.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.header,
    required this.body,
    this.color,
    this.initiallyExpanded = false,
    this.headerBackgroundColor,
    this.bodyBackgroundColor,
    this.icon,
  });

  final Widget header;
  final Widget body;
  final Color? color;
  final Color? headerBackgroundColor;
  final Color? bodyBackgroundColor;
  final IconData? icon;
  final bool initiallyExpanded;

  static TextStyle defaultHeaderStyle(ThemeData theme) {
    return theme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const borderRadius = PredefinedPadding.medium;
    const headerPadding = EdgeInsets.all(PredefinedPadding.medium);
    const bodyPadding = EdgeInsets.symmetric(vertical: PredefinedPadding.regular, horizontal: PredefinedPadding.medium);
    const double iconSize = 24;
    return ExpandablePanel(
      initiallyExpanded: initiallyExpanded,
      useInkWell: true,
      borderRadius: borderRadius,
      color: color ?? theme.colorScheme.primary,
      iconSize: iconSize,
      headerPadding: headerPadding,
      bodyPadding: bodyPadding,
      headerBackgroundColor: headerBackgroundColor ?? theme.colorScheme.surface,
      bodyBackgroundColor: bodyBackgroundColor ?? theme.colorScheme.surface.multiply(.5),
      icon: icon,
      header: header,
      body: body,
    );
  }
}

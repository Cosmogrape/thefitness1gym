import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/global/widgets/animated_tap.dart';

class OverviewItem extends StatelessWidget {
  const OverviewItem({
    super.key,
    required this.textBig,
    required this.text,
    this.color,
    this.backgroundColor,
    this.icon,
    this.padding,
    this.onTap,
  });

  final String? textBig;
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;
  final EdgeInsets? padding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = this.color ?? theme.colorScheme.onBackground;
    final backgroundColor = this.backgroundColor ?? theme.colorScheme.background;

    final children = <Widget>[];
    if (icon != null) {
      children.add(Icon(icon, color: color, size: 20));
      var spaceWidth = PredefinedPadding.regular;
      if (padding != null) spaceWidth = padding!.horizontal / 2;
      children.add(SizedBox(width: spaceWidth));
    }
    children.add(Expanded(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$textBig ',
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
                letterSpacing: -.5,
              ),
            ),
            TextSpan(
              text: text,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ));

    final card = Container(
      padding: padding,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );

    return onTap == null ? card : AnimatedTap(child: card);
  }
}

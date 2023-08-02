import 'package:flutter/material.dart';

import '../../assets/values/predefined_size.dart';
import '../animated_tap.dart';

class OverViewItem extends StatelessWidget {
  const OverViewItem({
    super.key,
    required this.textBig,
    required this.text,
    this.color,
    this.backgroundColor,
    this.icon,
    this.onTap,
  });

  final String? textBig;
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = this.color ?? theme.colorScheme.onBackground;
    final backgroundColor = this.backgroundColor ?? theme.colorScheme.background;

    final card = ClipRRect(
      borderRadius: BorderRadius.circular(PredefinedSize.radiusMedium),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: PredefinedSize.paddingMedium, vertical: PredefinedSize.padding),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon == null ? const SizedBox.shrink() : Icon(icon, color: color, size: 20),
            icon == null ? const SizedBox.shrink() : SizedBox(width: PredefinedSize.padding),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$textBig ',
                      style: theme.textTheme.bodyLarge!.copyWith(
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
            ),
          ],
        ),
      ),
    );

    return onTap == null ? card : AnimatedTap(child: card);
  }
}

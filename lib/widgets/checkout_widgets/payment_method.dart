import 'package:flutter/material.dart';
import 'package:thefitness1gym/global/color_extension.dart';

import '../../values/predefined_padding.dart';
import '../../values/predefined_radius.dart';

class PaymentMethodButton extends StatelessWidget {
  final ThemeData theme;
  final IconData icon;
  final String title;
  final bool primary;
  final Function() onPressed;
  final bool isPressed;

  const PaymentMethodButton({
    super.key,
    required this.theme,
    required this.icon,
    required this.title,
    required this.primary,
    required this.onPressed,
    required this.isPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: isPressed
            ? BorderSide(
                width: 1,
                color: theme.colorScheme.primary,
              )
            : null,
        backgroundColor: primary ? Colors.amber.withBrightness(0.1) : theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PredefinedRadius.small)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PredefinedPadding.medium),
        child: Row(
          children: [
            Icon(icon, color: primary ? theme.colorScheme.primary : theme.colorScheme.secondary),
            const SizedBox(width: 10),
            Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(
                  color: primary ? theme.colorScheme.primary : theme.colorScheme.secondary,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

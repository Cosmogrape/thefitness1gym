import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';

import 'profile_item.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ProfileItem(
      color: theme.colorScheme.surface,
      headerBackgroundColor: theme.colorScheme.inverseSurface,
      bodyBackgroundColor: theme.colorScheme.error,
      icon: FontAwesomeIcons.rightFromBracket,
      header: Text(
        "Logout",
        style: ProfileItem.defaultHeaderStyle(theme).copyWith(
          color: theme.colorScheme.surface,
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.onError,
            backgroundColor: theme.colorScheme.error,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(PredefinedRadius.big),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: PredefinedPadding.medium,
              horizontal: PredefinedPadding.yomamaXXXX,
            ),
            textStyle: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Expanded(child: Text("CONFIRM")),
        ),
      ),
    );
  }
}

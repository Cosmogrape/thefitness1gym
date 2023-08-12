import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/widgets/profile_widgets/profile_item.dart';

class HelpAndFaq extends StatelessWidget {
  const HelpAndFaq({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ProfileItem(
      color: theme.colorScheme.surface,
      headerBackgroundColor: theme.colorScheme.inverseSurface,
      icon: FontAwesomeIcons.question,
      header: Text("Help & FAQ",
          style: ProfileItem.defaultHeaderStyle(theme).copyWith(
            color: theme.colorScheme.surface,
          )),
      body: Column(),
    );
  }
}

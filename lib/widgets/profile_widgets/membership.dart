import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/global/widgets/map_list.dart';
import 'package:thefitness1gym/widgets/profile_widgets/profile_item.dart';

class Membership extends StatelessWidget {
  const Membership({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const pad = SizedBox(height: PredefinedPadding.medium);

    final headerStyle = theme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
    );
    final titleStyle = theme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.secondary,
    );

    return ProfileItem(
      icon: FontAwesomeIcons.ticket,
      color: theme.colorScheme.primary,
      header: Text("Membership", style: headerStyle),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MapList(
            map: {
              "Serial No": "123456789",
              "Membership Type": "Saphire",
            },
            keyStyle: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
            valueStyle: theme.textTheme.bodyLarge,
          ),
          pad,
          Text("Package", style: titleStyle),
          pad,
          Text("Remaining", style: titleStyle),
          TextButton.icon(
            icon: const Icon(FontAwesomeIcons.plus),
            label: const Text("Renew"),
            onPressed: () {},
          ),
          pad,
          Text("History", style: titleStyle),
        ],
      ),
    );
  }
}

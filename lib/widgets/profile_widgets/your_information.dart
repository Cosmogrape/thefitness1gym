import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/global/widgets/map_list.dart';
import 'package:thefitness1gym/widgets/profile_widgets/profile_item.dart';

class YourInformation extends StatelessWidget {
  const YourInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final headerStyle = theme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
    );

    return ProfileItem(
      // initiallyExpanded: true,
      icon: FontAwesomeIcons.solidUser,
      header: Text("Your information", style: headerStyle),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: PredefinedPadding.small, horizontal: PredefinedPadding.regular),
        child: MapList(
          map: {
            "Name": "John Cena",
            "Address": "Kathmandu, Nepal",
            "Email": "therealjohn0_99@gmail.com",
            "DoB": DateTime(1970, 12, 31).format("d/m/Y"),
            "Gender": "Male",
            "Phone": "+999 123123456",
          },
          keyStyle: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
          valueStyle: theme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}

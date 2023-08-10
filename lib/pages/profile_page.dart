import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/global/widgets/expandable_panel.dart';
import 'package:thefitness1gym/widgets/page_title.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const ProfilePage());

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(PredefinedPadding.medium);

    const headerPadding = EdgeInsets.symmetric(
      vertical: PredefinedPadding.small,
      horizontal: PredefinedPadding.medium,
    );
    const bodyPadding = EdgeInsets.only(
      top: PredefinedPadding.regular,
      bottom: PredefinedPadding.medium,
      left: PredefinedPadding.medium,
      right: PredefinedPadding.medium,
    );

    const double iconSize = 24;
    final headerStyle = theme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
    );

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const PageTitle("Profile"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.background,
      ),
      body: ListView(
        children: [
          ExpandablePanel(
            borderRadius: borderRadius,
            color: theme.colorScheme.primary,
            icon: FontAwesomeIcons.user,
            iconSize: iconSize,
            header: Text("Your information", style: headerStyle),
            body: Text("Locations"),
            headerPadding: headerPadding,
            bodyPadding: bodyPadding,
          ),
        ],
      ),
    );
  }
}

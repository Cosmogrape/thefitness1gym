import 'package:flutter/material.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/page_title.dart';
import 'package:thefitness1gym/widgets/profile_widgets/membership.dart';
import 'package:thefitness1gym/widgets/profile_widgets/your_information.dart';

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

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const PageTitle("Profile"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.background,
      ),
      body: ListView(
        padding: const EdgeInsets.all(PredefinedPadding.medium),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: PredefinedPadding.medium,
              right: PredefinedPadding.medium,
              bottom: PredefinedPadding.large,
            ),
            child: Row(
              children: [
                const Hero(
                  tag: "pfp",
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage("lib/assets/images/pfp.png"),
                  ),
                ),
                const SizedBox(width: PredefinedPadding.medium),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Cena",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Strong member since 2014",
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const YourInformation(),
          const Membership(),
        ],
      ),
    );
  }
}

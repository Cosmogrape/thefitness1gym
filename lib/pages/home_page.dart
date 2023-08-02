import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/assets/values/predefiend_size.dart';
import 'package:thefitness1gym/widgets/headline_text.dart';
import 'package:thefitness1gym/widgets/overview_widget/overview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? Intentionally empty app bar:
      //? Gives the screen an opening/closing animation
      //? Controls status bar color
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: EdgeInsets.all(PredefinedSize.paddingBig),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadlineText(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.user),
                ),
              ],
            ),
            SizedBox(height: PredefinedSize.paddingBig),
            const Row(children: [
              Overview(),
              Overview(),
            ]),
          ],
        ),
      ),
    );
  }
}

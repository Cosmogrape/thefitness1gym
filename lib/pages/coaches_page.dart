import 'package:flutter/material.dart';
import 'package:thefitness1gym/models/coach_skill.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/widgets/coaches_widgets/coach_item.dart';
import 'package:thefitness1gym/widgets/page_title.dart';

class CoachesPage extends StatefulWidget {
  const CoachesPage(this.title, {super.key});

  final String title;

  static MaterialPageRoute route(String branch) => MaterialPageRoute(builder: (context) => CoachesPage(branch));

  @override
  State<CoachesPage> createState() => _CoachesPageState();
}

class _CoachesPageState extends State<CoachesPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final size = MediaQuery.of(context).size;
    const pad = SizedBox(height: PredefinedPadding.medium);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        centerTitle: true,
        title: const PageTitle("Coaches"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(PredefinedPadding.medium),
              child: Column(
                children: [
                  Hero(
                    tag: "branchTitle_${widget.title}",
                    child: Text(widget.title, style: theme.textTheme.titleLarge),
                  ),
                  Divider(color: theme.colorScheme.surface),
                  pad,
                  pad,
                  const CoachItem(
                    name: "Nizam Nazim",
                    description:
                        "Certified fitness trainer and bodybuilder from India, Bahrain, UAE, and Azerbaijan. Inspiring dedication to health and fitness.",
                    skills: [CoachSkill.bodybuilding, CoachSkill.fitnessTraining, CoachSkill.healthCoaching],
                    image: "nizam.jpg",
                  ),
                  pad,
                  const CoachItem(
                    name: "Gordon Ramsay",
                    description: "fitness trainer and bodybuilder from earth. Inspiring dedication to health and fitness.",
                    skills: [CoachSkill.bodybuilding, CoachSkill.zombaTraining, CoachSkill.fitnessTraining, CoachSkill.healthCoaching],
                    image: "chris.png",
                  ),
                  pad,
                  const CoachItem(
                    name: "Syed Osman",
                    description:
                        "Certified fitness trainer and bodybuilder from India, Bahrain, UAE, and Azerbaijan. Inspiring dedication to health and fitness.",
                    skills: [CoachSkill.bodybuilding, CoachSkill.fitnessTraining, CoachSkill.healthCoaching],
                    image: "osman.jpg",
                  ),
                  const SizedBox(height: PredefinedPadding.yomamaZ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

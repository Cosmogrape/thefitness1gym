import 'package:flutter/material.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';

class WorkoutPlans extends StatefulWidget {
  const WorkoutPlans({super.key});

  @override
  State<StatefulWidget> createState() => _WorkoutPlansState();
}

class _WorkoutPlansState extends State<WorkoutPlans> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: PredefinedPadding.medium,
        bottom: PredefinedPadding.medium,
        left: PredefinedPadding.regular,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: PredefinedPadding.regular,
            ),
            child: Text(
              "Workout Plans",
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // ListView(
          //   scrollDirection: Axis.horizontal,
          //   shrinkWrap: true,
          //   children: [
          //     // WorkoutPlanItem(
          //     //   title: "Beginner",
          //     //   imagePath: "assets/images/dumbbell_man.png",
          //     // ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

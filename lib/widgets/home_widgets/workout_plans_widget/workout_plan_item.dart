import 'package:flutter/material.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';

import '../home_card.dart';

class WorkoutPlanItem extends StatefulWidget {
  const WorkoutPlanItem({
    super.key,
    required this.title,
    this.imagePath,
    this.heroTag,
    this.onTap,
  });

  final String title;
  final String? imagePath;
  final String? heroTag;
  final Function()? onTap;

  @override
  State<StatefulWidget> createState() => _WorkoutPlanItemState();
}

class _WorkoutPlanItemState extends State<WorkoutPlanItem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<Widget> children = [];

    if (widget.heroTag != null) {
      children.add(
        Image.asset(
          widget.imagePath!,
          fit: BoxFit.cover,
          height: 200,
          width: 200,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              child: child,
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container();
          },
        ),
      );
    }
    children.add(
      Positioned(
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(PredefinedRadius.regular),
              topRight: Radius.circular(PredefinedRadius.regular),
            ),
          ),
          child: Text(widget.title),
        ),
      ),
    );

    return HomeCard(
      heroTag: widget.heroTag,
      onTap: widget.onTap,
      child: Stack(children: children),
    );
  }
}

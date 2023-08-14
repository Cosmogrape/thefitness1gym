import 'package:flutter/material.dart';
import 'package:thefitness1gym/global/color_extension.dart';
import 'package:thefitness1gym/global/widgets/animated_tap.dart';
import 'package:thefitness1gym/global/widgets/mono_eased_gradient.dart';
import 'package:thefitness1gym/global/widgets/parallax_flow_delegate.dart';
import 'package:thefitness1gym/models/coach_skill.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';

//? Keep stateful because it will download data from the internet and display it once the demo stage is over
@immutable
class CoachItem extends StatefulWidget {
  const CoachItem({
    super.key,
    required this.name,
    required this.description,
    required this.skills,
    required this.image,
  });

  final String name;
  final String description;
  final List<CoachSkill> skills;

  //TODO: Change to URL in production stage
  final String image;

  @override
  State<CoachItem> createState() => _CoachItemState();
}

class _CoachItemState extends State<CoachItem> {
  final GlobalKey _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(PredefinedRadius.medium);
    const pad = SizedBox(height: PredefinedPadding.regular);

    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: theme.colorScheme.primary.multiply(.5),
        ),
        child: AnimatedTap(
          useInkWell: true,
          inkWellBorderRadius: borderRadius,
          onTap: () {},
          tapDownOpacity: .6,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Stack(
                children: [
                  Flow(
                    delegate: ParallaxFlowDelegate(
                      scrollable: Scrollable.of(context),
                      listItemContext: context,
                      backgroundImageKey: _imageKey,
                    ),
                    children: [
                      Image.asset(
                        key: _imageKey,
                        height: MediaQuery.of(context).size.height,
                        "assets/images/coach/${widget.image}",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  MonoEasedGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PredefinedPadding.medium,
                        vertical: PredefinedPadding.medium,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: theme.colorScheme.secondary,
                              shadows: [
                                Shadow(
                                  color: theme.colorScheme.primary,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          pad,
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(widget.description),
                          ),
                          pad,
                          Text(
                            "Expertise:",
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                          Wrap(
                            spacing: PredefinedPadding.small,
                            children: List<Widget>.generate(widget.skills.length, (i) {
                              return Chip(
                                padding: const EdgeInsets.all(PredefinedPadding.smallX),
                                backgroundColor: theme.colorScheme.primary.multiply(.5).withOpacity(.5),
                                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                                labelStyle: theme.textTheme.bodySmall,
                                label: Text(widget.skills[i].name),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

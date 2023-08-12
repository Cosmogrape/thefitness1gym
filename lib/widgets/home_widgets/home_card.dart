import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thefitness1gym/global/widgets/animated_tap.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({
    super.key,
    this.child,
    this.color,
    this.backgroundColor,
    this.onTap,
    this.heroTag,
  });

  final Widget? child;
  final Color? color;
  final Color? backgroundColor;
  final Function()? onTap;
  final String? heroTag;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool show = false;
  void _resetAnimation() {
    show = false;
    Future.delayed(Duration(milliseconds: 200 + Random().nextInt(300)), () {
      setState(() => show = true);
    });
  }

  @override
  void initState() {
    super.initState();
    _resetAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(PredefinedRadius.medium);

    final card = Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      color: widget.backgroundColor ?? widget.color ?? theme.colorScheme.surface,
      child: widget.child,
    );

    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: const Duration(seconds: 1),
      child: AnimatedTap(
        useInkWell: true,
        inkWellColor: widget.color,
        inkWellBorderRadius: borderRadius,
        tapDownOpacity: .6,
        onTap: widget.onTap,
        child: widget.heroTag == null
            ? card
            : Hero(
                tag: widget.heroTag!,
                transitionOnUserGestures: true,
                child: card,
              ),
      ),
    );
  }
}

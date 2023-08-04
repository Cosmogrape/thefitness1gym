import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';
import 'package:thefitness1gym/global/widgets/animated_tap.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({this.child, this.color, super.key});

  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(PredefinedSize.radiusMedium);

    return Expanded(
      child: AnimatedTap(
        tapDownOpacity: .6,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Scaffold(body: Center(child: Text("Overview"))),
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          color: color ?? theme.colorScheme.surface,
          child: child,
        ),
      ),
    );
  }
}

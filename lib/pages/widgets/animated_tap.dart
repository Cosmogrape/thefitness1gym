import 'package:flutter/material.dart';

class AnimatedTap extends StatefulWidget {
  const AnimatedTap({
    this.child,
    this.onTap,
    this.tapDownScale = .95,
    this.tapDownOpacity = .9,
    super.key,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final double tapDownScale;
  final double tapDownOpacity;

  @override
  State<AnimatedTap> createState() => _AnimatedTapCardState();
}

class _AnimatedTapCardState extends State<AnimatedTap> {
  bool tapping = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => tapping = true),
      // onTapUp: (_) => setState(() => tapping = false),
      onTapCancel: () => setState(() => tapping = false),
      onTap: () {
        widget.onTap?.call();
        //? Need this to reset if the tapUp event was skipped (ex: in case of pop up)
        Future.delayed(const Duration(milliseconds: 100), () => setState(() => tapping = false));
      },
      child: AnimatedOpacity(
        opacity: tapping ? widget.tapDownOpacity : 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: AnimatedScale(
          scale: tapping ? widget.tapDownScale : 1,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}

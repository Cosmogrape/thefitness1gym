import 'package:flutter/material.dart';

class AnimatedTap extends StatefulWidget {
  const AnimatedTap({
    this.child,
    this.tapDownScale = .95,
    this.tapDownOpacity = .9,
    this.opacityDuration = const Duration(milliseconds: 300),
    this.scaleDuration = const Duration(milliseconds: 100),
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    super.key,
  });

  final Widget? child;
  final double tapDownScale;
  final double tapDownOpacity;
  final Duration opacityDuration;
  final Duration scaleDuration;
  final Function()? onTap;
  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;
  final Function()? onTapCancel;

  @override
  State<AnimatedTap> createState() => _AnimatedTapCardState();
}

class _AnimatedTapCardState extends State<AnimatedTap> {
  bool tapping = false;
  void _setTap(bool value) => setState(() => tapping = value);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (tapDownDetails) => {_setTap(true), widget.onTapDown?.call(tapDownDetails)},
      onTapUp: (tapUpDetails) => {_setTap(false), widget.onTapUp?.call(tapUpDetails)},
      onTapCancel: () => {_setTap(false), widget.onTapCancel?.call()},
      onTap: () {
        //? Need this to reset if the tapUp event was skipped (ex: in case of pop up)
        Future.delayed(widget.scaleDuration, () => _setTap(false));
        widget.onTap?.call();
      },
      child: AnimatedOpacity(
        opacity: tapping ? widget.tapDownOpacity : 1,
        duration: widget.opacityDuration,
        curve: Curves.easeOut,
        child: AnimatedScale(
          scale: tapping ? widget.tapDownScale : 1,
          duration: widget.scaleDuration,
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}

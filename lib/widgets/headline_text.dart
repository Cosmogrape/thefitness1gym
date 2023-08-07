import 'dart:async';

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:thefitness1gym/widgets/fitness1_title.dart';
import 'package:thefitness1gym/widgets/hello_username.dart';

class HeadlineText extends StatefulWidget {
  const HeadlineText({super.key});

  @override
  State<HeadlineText> createState() => _HeadlineTextState();
}

class _HeadlineTextState extends State<HeadlineText> {
  Timer? _timer;
  int index = -1;
  int indexMax = 2;

  _reset() {
    setState(() {
      index = -1;
      if (_timer?.isActive == true) _timer!.cancel();
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (index >= indexMax) return;
        setState(() {
          index++;
          if (index >= indexMax) _timer?.cancel();
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _reset();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onBackground,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _animated(
          show: index == 0,
          child: const HelloUsername(),
        ),
        _animated(
          show: index == 1,
          child: Text("Keep up the good work!", style: textStyle),
        ),
        _animated(
          show: index == 2,
          child: GestureDetector(
            onTap: _reset,
            child: const Fitness1Title(),
          ),
        ),
      ],
    );
  }

  /// Just a shortcut
  _animated({required Widget child, required bool show}) {
    return Flexible(
      child: AnimatedSizeAndFade(
        fadeDuration: const Duration(seconds: 2),
        sizeDuration: const Duration(milliseconds: 300),
        fadeOutCurve: Curves.easeOut,
        fadeInCurve: Curves.easeOut,
        sizeCurve: Curves.easeOut,
        child: show ? child : const SizedBox.shrink(),
      ),
    );
  }
}

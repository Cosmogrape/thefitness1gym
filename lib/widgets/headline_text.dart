import 'dart:async';

import "package:animated_size_and_fade/animated_size_and_fade.dart";
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
  int index = 0;
  int indexMax = 2;

  _reset() {
    setState(() {
      index = 0;
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
    const sizeDuration = Duration(milliseconds: 650);
    const fadeDuration = Duration(seconds: 2);

    final textStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onBackground,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedOpacity(
          opacity: index < 0 ? 0 : 1,
          duration: fadeDuration,
          child: AnimatedSizeAndFade(
            sizeDuration: sizeDuration,
            fadeDuration: fadeDuration,
            child: index == 0
                ? const HelloUsername()
                : AnimatedSizeAndFade(
                    sizeDuration: sizeDuration,
                    fadeDuration: fadeDuration,
                    child: index > 0 && index < indexMax ? Text("Keep up the good work!", style: textStyle) : const SizedBox(),
                  ),
          ),
        ),
        AnimatedSizeAndFade(
          sizeDuration: sizeDuration,
          fadeDuration: fadeDuration,
          child: index >= indexMax
              ? GestureDetector(
                  onTap: _reset,
                  child: const Fitness1Title(),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}

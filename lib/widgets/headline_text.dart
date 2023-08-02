import 'dart:async';

import "package:animated_size_and_fade/animated_size_and_fade.dart";
import 'package:flutter/material.dart';

class HeadlineText extends StatefulWidget {
  const HeadlineText({super.key});

  @override
  State<HeadlineText> createState() => _HeadlineTextState();
}

class _HeadlineTextState extends State<HeadlineText> {
  late Timer _timer;
  int index = 0;
  int indexMax = 2;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (index >= indexMax) return;
      setState(() {
        index++;
        if (index >= indexMax) _timer.cancel();
      });
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const sizeDuration = Duration(milliseconds: 500);
    const fadeDuration = Duration(seconds: 2);

    final textStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onBackground,
        );
    final usernameStyle = textStyle.copyWith(
      color: theme.colorScheme.primary,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
                ? Text("Hello,", style: textStyle)
                : AnimatedSizeAndFade(
                    sizeDuration: sizeDuration,
                    fadeDuration: fadeDuration,
                    child: index < indexMax ? Text("Keep up the good work!", style: textStyle) : const SizedBox.shrink(),
                  ),
          ),
        ),
        Text("Jack", style: usernameStyle),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class HelloUsername extends StatelessWidget {
  const HelloUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onBackground,
        );
    return RichText(
        text: TextSpan(
      text: "Hello, ",
      style: textStyle,
      children: [
        TextSpan(
          text: "John Cena", //TODO: get actual username
          style: textStyle?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    ));
  }
}

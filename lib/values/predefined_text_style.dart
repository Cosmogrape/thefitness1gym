import 'package:flutter/material.dart';

class PredefinedTextStyle {
  static TextStyle? pageTitle(ThemeData theme) {
    return theme.textTheme.headlineSmall?.copyWith(
      color: theme.colorScheme.onBackground,
      fontWeight: FontWeight.bold,
    );
  }
}

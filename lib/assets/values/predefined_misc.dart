import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PredefinedMisc {
  static SystemUiOverlayStyle systemUiOverlayStyle(ThemeData theme) {
    final brightness = theme.brightness;
    final brightnessFore = brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    return SystemUiOverlayStyle(
      statusBarBrightness: brightness,
      statusBarColor: theme.colorScheme.background,
      systemNavigationBarColor: theme.colorScheme.background,
      statusBarIconBrightness: brightnessFore,
      systemNavigationBarIconBrightness: brightnessFore,
    );
  }
}

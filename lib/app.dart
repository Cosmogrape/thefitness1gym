import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefitness1gym/values/predefined_misc.dart';

import 'pages/signup_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  Brightness get defaultBrightness => Brightness.dark;

  ColorScheme get defaultColorScheme => ColorScheme(
        brightness: defaultBrightness,
        //
        primary: Colors.amber,
        primaryContainer: Colors.amber.shade800,
        onPrimary: Colors.black,
        secondary: Colors.white,
        onSecondary: Colors.black,
        outline: Colors.amber.withOpacity(.5),
        //
        background: Colors.black,
        onBackground: Colors.white,
        surface: Colors.grey.shade900,
        onSurface: Colors.white70,
        surfaceVariant: Colors.black87,
        onSurfaceVariant: Colors.white70,
        surfaceTint: Colors.amberAccent,
        //
        error: Colors.red, // Red color for error
        onError: Colors.white,
      );
  ThemeData get defaultTheme => ThemeData(
        brightness: defaultBrightness,
        colorScheme: defaultColorScheme,
        useMaterial3: true,
      );

  @override
  Widget build(BuildContext context) {
    final themeWithGoogleFonts = defaultTheme.copyWith(
      textTheme: GoogleFonts.cairoTextTheme(defaultTheme.textTheme),
    );

    SystemChrome.setSystemUIOverlayStyle(
      PredefinedMisc.systemUiOverlayStyle(themeWithGoogleFonts),
    );

    return MaterialApp(
      title: "The Fitness 1 Gym",
      theme: themeWithGoogleFonts,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("ar")], // English / Arabic
      home: const SignupPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefitness1gym/pages/signup_page.dart';

class App extends StatelessWidget {
  const App({super.key});
  ColorScheme get defaultColorScheme => ColorScheme(
        brightness: Brightness.dark,
        //
        primary: Colors.amber,
        primaryContainer: Colors.amber.shade800,
        onPrimary: Colors.black,
        secondary: Colors.white,
        onSecondary: Colors.black,
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
        colorScheme: defaultColorScheme,
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Fitness 1 Gym',
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      home: const SignupPage(),
    );
  }
}

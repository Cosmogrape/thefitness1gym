import 'package:flutter/material.dart';
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
        useMaterial3: true,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Fitness 1 Gym',
      theme: defaultTheme,
      home: const SignupPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

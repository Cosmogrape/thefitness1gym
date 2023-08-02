import 'package:flutter/material.dart';
import 'package:thefitness1gym/pages/home_page.dart';

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

  // ColorScheme get defaultColorScheme => ColorScheme(
  //       brightness: Brightness.dark,
  //       //
  //       primary: Colors.amber,
  //       onPrimary: Colors.black87,
  //       primaryContainer: Colors.amber.shade700,
  //       onPrimaryContainer: Colors.black87,
  //       secondary: Colors.amber.shade700,
  //       onSecondary: Colors.black87,
  //       //
  //       //
  //       background: Colors.black,
  //       onBackground: Colors.white,
  //       surface: Colors.black87,
  //       onSurface: Colors.white70,
  //       surfaceVariant: Colors.black54,
  //       onSurfaceVariant: Colors.white70,
  //       surfaceTint: Colors.amberAccent,
  //       //
  //       error: Colors.amber.shade900,
  //       onError: Colors.white70,
  //     );
  ThemeData get defaultTheme => ThemeData(
        colorScheme: defaultColorScheme,
        useMaterial3: true,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Fitness 1 Gym',
      theme: defaultTheme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

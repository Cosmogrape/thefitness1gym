import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fitness1Title extends StatelessWidget {
  const Fitness1Title({this.customTextStyle, super.key});

  final TextStyle? customTextStyle;

  @override
  Widget build(BuildContext context) {
    final style = customTextStyle ?? Theme.of(context).textTheme.displaySmall;
    if (style == null) {
      //? should not happen but just in case
      return const Text("FITNESS1");
    }
    final colorTheme = Theme.of(context).colorScheme;

    final titleStyle = style.copyWith(
      letterSpacing: 1.5,
      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
      color: colorTheme.onBackground,
      fontWeight: FontWeight.bold,
    );
    final oneStyle = style.copyWith(
      letterSpacing: -1.5,
      fontFamily: GoogleFonts.robotoSlab().fontFamily,
      fontWeight: FontWeight.bold,
      color: colorTheme.primary,
    );
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "FITNESS", style: titleStyle),
          TextSpan(text: " 1", style: oneStyle),
        ],
      ),
    );
  }
}

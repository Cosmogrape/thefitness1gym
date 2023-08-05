import "package:flutter/material.dart";
import "package:thefitness1gym/assets/values/predefined_text_style.dart";

@immutable
class PageTitle extends StatelessWidget {
  const PageTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(text, style: PredefinedTextStyle.pageTitle(theme));
  }
}

import 'package:flutter/material.dart';

class MonoEasedGradient extends StatelessWidget {
  const MonoEasedGradient({
    super.key,
    this.color = Colors.transparent,
    this.width,
    this.height,
    required this.begin,
    required this.end,
  });

  final Color color;
  final double? width;
  final double? height;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(Curves.easeOut.d),
            color.withOpacity(Curves.easeOut.c),
            color.withOpacity(Curves.easeOut.b),
            color.withOpacity(Curves.easeOut.a),
          ],
          begin: begin,
          end: end,
        ),
      ),
    );
  }
}

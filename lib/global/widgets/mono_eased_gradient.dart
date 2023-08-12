import 'package:flutter/material.dart';

class MonoEasedGradient extends StatelessWidget {
  const MonoEasedGradient({
    super.key,
    this.color = Colors.transparent,
    this.width,
    this.height,
    required this.begin,
    required this.end,
    this.curve = Curves.easeOut,
  });

  final Color color;
  final double? width;
  final double? height;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final Cubic curve;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(curve.d),
            color.withOpacity(curve.c),
            color.withOpacity(curve.b),
            color.withOpacity(curve.a),
          ],
          begin: begin,
          end: end,
        ),
      ),
    );
  }
}

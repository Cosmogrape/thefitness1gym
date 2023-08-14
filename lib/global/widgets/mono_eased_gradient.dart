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
            color,
            color.withOpacity(.823974609375),
            color.withOpacity(.669921875),
            color.withOpacity(.536376953125),
            color.withOpacity(.324951171875),
            color.withOpacity(.177978515625),
            color.withOpacity(.125),
            color.withOpacity(.083740234375),
            color.withOpacity(.052734375),
            color.withOpacity(.030517578125),
            color.withOpacity(.015625),
            color.withOpacity(.006591796875),
            color.withOpacity(.001953125),
            color.withOpacity(.000244140625),
            color.withOpacity(0),
          ],
          begin: begin,
          end: end,
        ),
      ),
    );
  }
}

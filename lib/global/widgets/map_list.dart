import 'package:flutter/material.dart';

class MapList extends StatelessWidget {
  const MapList({
    super.key,
    required this.map,
    this.keyStyle,
    this.valueStyle,
  });

  final Map<String, String> map;
  final TextStyle? keyStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<RichText>.generate(map.length, (i) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(text: '${map.keys.elementAt(i)}: ', style: keyStyle),
              TextSpan(text: map.values.elementAt(i), style: valueStyle),
            ],
          ),
        );
      }),
    );
  }
}

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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: map.length,
      itemBuilder: (context, index) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(text: '${map.keys.elementAt(index)}: ', style: keyStyle),
              TextSpan(text: map.values.elementAt(index), style: valueStyle),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:math';

import 'package:intl/intl.dart';

class DiscountInfo {
  const DiscountInfo({
    required double value,
    required this.end,
    this.symbol,
  }) : _value = value;

  final double _value;
  final DateTime end;
  final String? symbol;

  bool get isDiscounted => value > 0;
  bool get isPercentage => symbol?.trim() == '%';
  double get value => isPercentage ? _value.clamp(0, 100) : max(0, _value);

  String formatValue({bool withSymbol = false}) {
    final value = NumberFormat.decimalPatternDigits(
      locale: "en_US",
      decimalDigits: this.value % 1 == 0 ? 0 : 2,
    ).format(this.value);
    return "$value${withSymbol ? symbol : ''}";
  }
}

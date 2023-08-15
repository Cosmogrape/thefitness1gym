import 'package:intl/intl.dart';

class DiscountInfo {
  DiscountInfo({
    required this.value,
    required this.end,
    this.symbol,
  });

  final double value;
  final DateTime end;
  final String? symbol;

  bool get isPercentage => symbol?.trim() == '%';

  String formatValue({bool withSymbol = false}) {
    final value = NumberFormat.decimalPatternDigits(
      locale: "en_US",
      decimalDigits: this.value % 1 == 0 ? 0 : 2,
    ).format(this.value);
    return "$value${withSymbol ? symbol : ''}";
  }
}

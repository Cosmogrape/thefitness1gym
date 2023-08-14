class DiscountInfo {
  DiscountInfo({
    required this.value,
    required this.end,
    this.isPercentage = true,
  });

  final double value;
  final DateTime end;
  final bool isPercentage;

  @override
  String toString() => "-$value${isPercentage ? '%' : ''}";
}

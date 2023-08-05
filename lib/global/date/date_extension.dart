extension DateExtension on DateTime {
  /// Returns true if the [DateTime] is the same year
  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  /// Returns true if the [DateTime] is the same year and month
  bool isSameYearMonth(DateTime other) {
    return isSameYear(other) && month == other.month;
  }

  /// Returns true if the [DateTime] is the same year, month and day
  bool isSameYearMonthDay(DateTime other) {
    return isSameYearMonth(other) && day == other.day;
  }

  /// Returns the [DateTime] of yesterday at the same time
  DateTime get yesterday => DateTime(year, month, day - 1, hour, minute, second, millisecond, microsecond);

  /// Returns the [DateTime] of tomorrow at the same time
  DateTime get tomorrow => DateTime(year, month, day + 1, hour, minute, second, millisecond, microsecond);

  bool get isYesterday => isSameYearMonthDay(yesterday);
  bool get isToday => isSameYearMonthDay(DateTime.now());
  bool get isTomorrow => isSameYearMonthDay(tomorrow);

  bool get isThisYear => isSameYear(DateTime.now());
  bool get isThisMonth => isSameYearMonth(DateTime.now());
}

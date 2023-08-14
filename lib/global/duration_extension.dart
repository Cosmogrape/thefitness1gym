extension DurationExtension on Duration {
  String format({bool abbreviated = false, String joint = ", "}) {
    final months = inDays ~/ 30;
    final days = inDays % 30;
    final hours = inHours % 24;
    final minutes = inMinutes % 60;
    final seconds = inSeconds % 60;

    final parts = <String>[];

    if (months > 0) {
      final suffix = abbreviated ? "mo" : " month${months > 1 ? "s" : ""}";
      parts.add("$months$suffix");
    }
    if (days > 0) {
      final suffix = abbreviated ? "d" : " day${days > 1 ? "s" : ""}";
      parts.add("$days$suffix");
    }

    if (hours > 0) {
      final suffix = abbreviated ? "h" : " hour${hours > 1 ? "s" : ""}";
      parts.add("$hours$suffix");
    }

    if (minutes > 0) {
      final suffix = abbreviated ? "m" : " minute${minutes > 1 ? "s" : ""}";
      parts.add("$minutes$suffix");
    }

    if (seconds > 0) {
      final suffix = abbreviated ? "s" : " second${seconds > 1 ? "s" : ""}";
      parts.add("$seconds$suffix");
    }

    return parts.join(joint);
  }
}

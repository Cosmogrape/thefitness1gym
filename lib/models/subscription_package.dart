import 'package:intl/intl.dart';
import 'package:thefitness1gym/models/discount_info.dart';

enum SubscriptionPackageType {
  membership("Membership"),
  personalTraining("Personal Training");

  const SubscriptionPackageType(this.name);
  final String name;
}

/// This (and similar stuff) will be models in order to act as proxy for the data from the server.
/// So the data will be fetched from the server and then parsed into this model.
class SubscriptionPackage {
  SubscriptionPackage({
    required this.id,
    required this.type,
    required this.duration,
    required this.price,
    required this.currency,
    this.discount,
    this.perks,
  });

  final String id;
  final SubscriptionPackageType type;
  final Duration duration;
  final double price;
  final String currency;
  final DiscountInfo? discount;
  final List<String>? perks;

  double get discountedPrice {
    if (discount == null) return price;
    return price - (discount!.isPercentage ? price * (discount!.value / 100) : discount!.value);
  }

  String formatPrice({bool withCurrency = false, bool withDiscount = false, String joint = ''}) {
    final targetValue = withDiscount ? discountedPrice : price;
    final value = NumberFormat.currency(
      customPattern: "#,###.##",
      locale: "en_US",
      decimalDigits: targetValue % 1 == 0 ? 0 : 2,
    ).format(targetValue);
    return value + joint + (withCurrency ? currency : '');
  }
}

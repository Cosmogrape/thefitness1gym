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

  /// Use this instead of checking [discount]!=null
  /// This ensures that the discount is real
  bool get isDiscounted => discount != null && discount!.isDiscounted;

  /// Value of discount only
  ///
  /// Ex:
  /// - price = 200
  /// - discount = 10%
  /// - >> then discountValue = 20
  double get discountValue {
    if (discount == null) return 0;
    if (discount!.isPercentage) return price * (discount!.value / 100);
    return discount!.value;
  }

  /// The price after discount
  ///
  /// Ex:
  /// - price = 200
  /// - discount = 10%
  /// - >> then priceAfterDiscount = 180
  double get priceAfterDiscount => price - discountValue;

  String formatPrice({bool withCurrency = false, bool withDiscount = false, String joint = ''}) {
    final targetValue = withDiscount ? priceAfterDiscount : price;
    final value = NumberFormat.currency(
      customPattern: "#,###.##",
      locale: "en_US",
      decimalDigits: targetValue % 1 == 0 ? 0 : 2,
    ).format(targetValue);
    return value + joint + (withCurrency ? currency : '');
  }
}

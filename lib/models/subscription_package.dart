import 'package:thefitness1gym/models/discount_info.dart';

/// This (and similar stuff) will be models in order to act as proxy for the data from the server.
/// So the data will be fetched from the server and then parsed into this model.
class SubscriptionPackage {
  SubscriptionPackage({
    required this.duration,
    required this.price,
    required this.currency,
    this.discount,
    this.perks,
  });

  final Duration duration;
  final double price;
  final String currency;
  final DiscountInfo? discount;
  final List<String>? perks;
}

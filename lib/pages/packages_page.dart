import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:thefitness1gym/global/widgets/mono_eased_gradient.dart';
import 'package:thefitness1gym/models/discount_info.dart';
import 'package:thefitness1gym/models/subscription_package.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';
import 'package:thefitness1gym/widgets/packages_widgets/package_item.dart';
import 'package:thefitness1gym/widgets/page_title.dart';

class PackagesPage extends StatefulWidget {
  const PackagesPage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const PackagesPage());

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  static const horizontalPaddingSize = PredefinedPadding.medium;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onBackground);

    const pad = SizedBox(height: PredefinedPadding.regular);

    return SlidingUpPanel(
      minHeight: 0,
      parallaxEnabled: true,
      panel: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(PredefinedRadius.medium),
        ),
        child: const Center(
          child: Text("Select a package"),
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.background,
          centerTitle: true,
          title: const PageTitle("Select a package"),
        ),
        body: ListView(
          children: [
            pad,
            pad,
            padded(Text("Membership:", style: titleStyle)),
            pad,
            packagesView(
              initialPage: 1,
              items: [
                PackageItem(
                  package: SubscriptionPackage(
                    duration: const Duration(days: 30),
                    price: 200,
                    currency: "AED",
                    perks: [
                      "Free daily cookie",
                      "Meet me in person",
                      "Existential crisis",
                    ],
                  ),
                ),
                PackageItem(
                  highlight: true,
                  package: SubscriptionPackage(
                    duration: const Duration(days: 30),
                    price: 200,
                    currency: "AED",
                    discount: DiscountInfo(
                      value: 10,
                      end: DateTime.now().add(const Duration(days: 50)),
                    ),
                    perks: [
                      "Free daily cookie",
                      "Meet me in person",
                      "Existential crisis",
                    ],
                  ),
                ),
                PackageItem(
                  package: SubscriptionPackage(
                    duration: const Duration(days: 30),
                    price: 200,
                    currency: "AED",
                    discount: DiscountInfo(
                      value: 10,
                      end: DateTime.now().add(const Duration(days: 50)),
                    ),
                  ),
                ),
                PackageItem(
                  package: SubscriptionPackage(
                    duration: const Duration(days: 30),
                    price: 200,
                    currency: "AED",
                  ),
                ),
              ],
            ),
            pad,
            pad,
            pad,
            padded(Text("Personal Training:", style: titleStyle)),
            pad,
            packagesView(
              items: [
                PackageItem(
                  highlight: true,
                  package: SubscriptionPackage(
                    duration: const Duration(days: 6),
                    price: 200,
                    currency: "AED",
                    discount: DiscountInfo(
                      value: 10,
                      end: DateTime.now().add(const Duration(days: 50)),
                    ),
                    perks: [
                      "Free daily cookie",
                      "Meet me in person",
                      "Existential crisis",
                    ],
                  ),
                ),
                PackageItem(
                  package: SubscriptionPackage(
                    duration: const Duration(days: 30),
                    price: 200,
                    currency: "AED",
                  ),
                ),
                PackageItem(
                  package: SubscriptionPackage(
                    duration: const Duration(days: 30),
                    price: 200,
                    currency: "AED",
                    discount: DiscountInfo(
                      value: 10,
                      end: DateTime.now().add(const Duration(days: 1)),
                    ),
                  ),
                ),
                PackageItem(
                  package: SubscriptionPackage(
                    duration: const Duration(days: 30),
                    price: 200,
                    currency: "AED",
                  ),
                ),
              ],
            ),
            pad,
            pad,
          ],
        ),
      ),
    );
  }

  Padding padded(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPaddingSize),
        child: child,
      );

  Widget gradient({
    required double width,
    required AlignmentGeometry begin,
    required AlignmentGeometry end,
    double? left,
    double? right,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: 0,
      bottom: 0,
      child: IgnorePointer(
        child: MonoEasedGradient(
          width: width,
          color: Theme.of(context).colorScheme.background,
          begin: begin,
          end: end,
        ),
      ),
    );
  }

  SizedBox packagesView({required List<PackageItem> items, int initialPage = 0}) {
    const viewportFraction = .75;
    final gradientWidth = MediaQuery.of(context).size.width * (1 - viewportFraction);
    return SizedBox(
      height: 500,
      width: 500,
      child: Stack(
        children: [
          PageView(
            controller: PageController(viewportFraction: viewportFraction, initialPage: initialPage),
            children: items,
          ),
          gradient(
            left: 0,
            width: gradientWidth,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          gradient(
            right: 0,
            width: gradientWidth,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}

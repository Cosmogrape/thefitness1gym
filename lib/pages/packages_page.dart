import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:thefitness1gym/global/widgets/mono_eased_gradient.dart';
import 'package:thefitness1gym/models/discount_info.dart';
import 'package:thefitness1gym/models/subscription_package.dart';
import 'package:thefitness1gym/pages/package_checkout_page.dart';
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
  static const Size packageItemSize = Size(500, 450);
  PanelController panelController = PanelController();
  SubscriptionPackage? selectedPackage;

  void openSelection(SubscriptionPackage package) {
    setState(() => selectedPackage = package);
    panelController.open();
  }

  static const horizontalPaddingSize = PredefinedPadding.medium;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onBackground);

    const pad = SizedBox(height: PredefinedPadding.regular);

    final viewportHeight = MediaQuery.of(context).size.height;

    return SlidingUpPanel(
      backdropColor: theme.colorScheme.surface,
      controller: panelController,
      minHeight: 0,
      maxHeight: viewportHeight,
      borderRadius: BorderRadius.circular(PredefinedRadius.large),
      parallaxEnabled: true,
      panel: selectedPackage == null
          ? Container()
          : PackageCheckoutPage(
              panelController: panelController,
              package: selectedPackage!,
              packageItemSize: packageItemSize,
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
                  openSelection: openSelection,
                  package: SubscriptionPackage(
                    id: "1",
                    type: SubscriptionPackageType.membership,
                    duration: const Duration(days: 30),
                    price: 119,
                    currency: "AED",
                    perks: ["Free daily cookie", "Meet me in person", "Existential crisis"],
                  ),
                ),
                PackageItem(
                  openSelection: openSelection,
                  highlight: true,
                  package: SubscriptionPackage(
                    id: "12",
                    type: SubscriptionPackageType.membership,
                    duration: const Duration(days: 60),
                    price: 199,
                    currency: "AED",
                    discount: DiscountInfo(
                      value: 10,
                      end: DateTime.now().add(const Duration(days: 50)),
                      symbol: '%',
                    ),
                    perks: ["Free daily cookie", "Meet me in person", "Existential crisis"],
                  ),
                ),
                PackageItem(
                  openSelection: openSelection,
                  package: SubscriptionPackage(
                    id: "123",
                    type: SubscriptionPackageType.membership,
                    duration: const Duration(days: 90),
                    price: 289,
                    currency: "AED",
                    discount: DiscountInfo(
                      value: 12,
                      end: DateTime.now().add(const Duration(days: 50)),
                      symbol: '%',
                    ),
                  ),
                ),
                PackageItem(
                  openSelection: openSelection,
                  package: SubscriptionPackage(
                    id: "1234",
                    type: SubscriptionPackageType.membership,
                    duration: const Duration(days: 120),
                    price: 499,
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
                  openSelection: openSelection,
                  highlight: true,
                  package: SubscriptionPackage(
                    id: "12345",
                    type: SubscriptionPackageType.personalTraining,
                    duration: const Duration(days: 7),
                    price: 239,
                    currency: "AED",
                    discount: DiscountInfo(
                      value: 10,
                      end: DateTime.now().add(const Duration(days: 50)),
                      symbol: '%',
                    ),
                    perks: ["Free daily cookie", "Meet me in person", "Existential crisis"],
                  ),
                ),
                PackageItem(
                  openSelection: openSelection,
                  package: SubscriptionPackage(
                    id: "123456",
                    type: SubscriptionPackageType.personalTraining,
                    duration: const Duration(days: 30),
                    price: 349,
                    currency: "AED",
                  ),
                ),
                PackageItem(
                  openSelection: openSelection,
                  package: SubscriptionPackage(
                    id: "1234567",
                    type: SubscriptionPackageType.personalTraining,
                    duration: const Duration(days: 60),
                    price: 779,
                    currency: "AED",
                    discount: DiscountInfo(
                      value: 50,
                      end: DateTime.now().add(const Duration(days: 1)),
                      symbol: '%',
                    ),
                  ),
                ),
                PackageItem(
                  openSelection: openSelection,
                  package: SubscriptionPackage(
                    id: "12345678",
                    type: SubscriptionPackageType.personalTraining,
                    duration: const Duration(days: 30),
                    price: 999,
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
      height: packageItemSize.height,
      width: packageItemSize.width,
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

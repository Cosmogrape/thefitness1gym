import 'package:flutter/material.dart';
import 'package:thefitness1gym/global/widgets/mono_eased_gradient.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        toolbarHeight: 100,
        centerTitle: true,
        title: const PageTitle("Select a package"),
      ),
      body: ListView(
        children: [
          padded(Text("Membership:", style: titleStyle)),
          pad,
          packagesView(
            initialPage: 1,
            items: [
              PackageItem(
                title: "1 month",
                price: 200,
                currency: "AED",
                discount: 10,
                discountEnd: DateTime.now().add(const Duration(days: 50)),
              ),
              PackageItem(
                title: "3 months",
                price: 450,
                currency: "AED",
                discount: 20,
                highlight: true,
                discountEnd: DateTime.now().add(const Duration(days: 10)),
              ),
              PackageItem(
                title: "5 months",
                price: 450,
                currency: "AED",
                discount: 5,
                discountEnd: DateTime.now().add(const Duration(days: 50)),
              ),
              PackageItem(
                title: "6 months",
                price: 900,
                currency: "AED",
                discount: 10,
                discountEnd: DateTime.now().add(const Duration(days: 50)),
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
                title: "1 month",
                price: 200,
                currency: "AED",
                discount: 10,
                highlight: true,
                discountEnd: DateTime.now().add(const Duration(days: 50)),
              ),
              PackageItem(
                title: "3 months",
                price: 450,
                currency: "AED",
                discount: 20,
                discountEnd: DateTime.now().add(const Duration(days: 10)),
              ),
              PackageItem(
                title: "5 months",
                price: 450,
                currency: "AED",
                discount: 5,
                discountEnd: DateTime.now().add(const Duration(days: 50)),
              ),
              PackageItem(
                title: "6 months",
                price: 900,
                currency: "AED",
                discount: 10,
                discountEnd: DateTime.now().add(const Duration(days: 50)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding padded(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPaddingSize),
        child: child,
      );

  SizedBox packagesView({required List<PackageItem> items, int initialPage = 0}) {
    const viewportFraction = .75;
    return SizedBox(
      height: 300,
      width: 500,
      child: Stack(
        children: [
          PageView(
            controller: PageController(viewportFraction: viewportFraction, initialPage: initialPage),
            children: items,
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: MonoEasedGradient(
              color: Theme.of(context).colorScheme.background,
              width: MediaQuery.of(context).size.width * (1 - viewportFraction),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: MonoEasedGradient(
              color: Theme.of(context).colorScheme.background,
              width: horizontalPaddingSize * 4,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ],
      ),
    );
  }
}

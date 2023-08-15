import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:thefitness1gym/global/color_extension.dart';
import 'package:thefitness1gym/global/duration_extension.dart';
import 'package:thefitness1gym/models/subscription_package.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';
import 'package:thefitness1gym/widgets/packages_widgets/payment_method_button.dart';

import '../widgets/page_title.dart';

class PackageCheckoutPage extends StatefulWidget {
  const PackageCheckoutPage({
    super.key,
    required this.package,
    this.panelController,
    this.highlight = false,
    this.packageItemSize,
    this.borderRadius,
  });

  final SubscriptionPackage package;
  final PanelController? panelController;
  final bool highlight;
  final Size? packageItemSize;
  final BorderRadius? borderRadius;

  static MaterialPageRoute route(
    SubscriptionPackage package, {
    PanelController? panelController,
    bool highlight = false,
    BorderRadius? borderRadius,
  }) {
    return MaterialPageRoute(builder: (context) {
      return PackageCheckoutPage(
        panelController: panelController,
        package: package,
        highlight: highlight,
        borderRadius: borderRadius,
      );
    });
  }

  @override
  State<PackageCheckoutPage> createState() => _PackageCheckoutPageState();
}

class _PackageCheckoutPageState extends State<PackageCheckoutPage> {
  int? _selectedRadioButton = -1;

  static const horizontalPaddingSize = PredefinedPadding.medium;
  final codeController = TextEditingController();

  final padsm = const SizedBox(height: PredefinedPadding.small);
  final pad = const SizedBox(height: PredefinedPadding.regular);

  @override
  Widget build(BuildContext context) {
    bool selectedPayment = _selectedRadioButton! >= 0;

    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headlineSmall?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Scaffold(
        // appBar: AppBar(
        //   leading: widget.panelController == null
        //       ? null
        //       : IconButton(
        //           onPressed: widget.panelController!.close,
        //           icon: const Icon(Icons.keyboard_arrow_down_rounded),
        //         ),
        //   centerTitle: true,
        //   title: const PageTitle("Checkout"),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // alignment: Alignment.center,
              color: theme.colorScheme.surface,
              padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.medium, vertical: PredefinedPadding.medium),
              height: 80,
              child: Stack(
                children: [
                  const Center(child: PageTitle("Checkout")),
                  Positioned(
                    left: PredefinedPadding.medium,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      style: IconButton.styleFrom(fixedSize: const Size(48, 48)),
                      iconSize: 32,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      onPressed: widget.panelController?.close,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: padded(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        pad,
                        pad,
                        Text('Selected package', style: titleStyle),
                        pad,
                        pad,
                        paymentInfo(theme),
                        pad,
                        pad,
                        Text("Payment method", style: titleStyle),
                        pad,
                        pad,
                        paymentMethodSection(theme),
                        pad,
                        pad,
                      ],
                    ),
                    ElevatedButton(
                      onPressed: selectedPayment ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        padding: const EdgeInsets.symmetric(horizontal: PredefinedPadding.large, vertical: PredefinedPadding.medium),
                      ),
                      child: Text(
                        "Continue".toUpperCase(),
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: selectedPayment ? theme.colorScheme.background : theme.colorScheme.secondary.withLightness(.3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    pad,
                    pad,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding padded(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPaddingSize),
        child: child,
      );

  Widget paymentInfo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(PredefinedRadius.small),
          child: Container(
            color: theme.colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(PredefinedPadding.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${widget.package.duration.format()} ${widget.package.type.name} package",
                      style: theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.secondary),
                    ),
                  ),
                  Text(widget.package.formatPrice(withCurrency: true, joint: " ")),
                ],
              ),
            ),
          ),
        ),
        padsm,
        if (widget.package.discount != null)
          Row(
            children: [
              Icon(FontAwesomeIcons.tag, size: 18, color: theme.colorScheme.primary),
              const SizedBox(width: PredefinedPadding.regular),
              Text(
                "Discount  -${widget.package.discount!.formatValue(withSymbol: true)}",
                style: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        padsm,
        padsm,
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Total:",
                style: theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.secondary, fontWeight: FontWeight.w600),
              ),
              const WidgetSpan(child: SizedBox(width: PredefinedPadding.small)),
              if (widget.package.discount != null) ...[
                TextSpan(
                  text: widget.package.formatPrice(withCurrency: true, joint: " "),
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.secondary.multiply(.5),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(width: PredefinedPadding.smallX),
                ),
              ],
              TextSpan(
                text: widget.package.formatPrice(withCurrency: true, withDiscount: true, joint: " "),
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget paymentMethodSection(ThemeData theme) {
    return Column(
      children: [
        Column(
          children: [
            PaymentMethodButton(
              primary: true,
              theme: theme,
              icon: Icons.credit_card,
              title: "Using your Credit/Debit Card",
              onPressed: () => setState(() => _selectedRadioButton = 0),
              isPressed: _selectedRadioButton == 0, // TODO: add a state to the payment method
            ),
            padsm,
            PaymentMethodButton(
              primary: false,
              theme: theme,
              icon: Icons.location_on_outlined,
              title: "Directly at our branch",
              onPressed: () => setState(() => _selectedRadioButton = 1),
              isPressed: _selectedRadioButton == 1,
            ),
          ],
        ),
        pad,
        pad,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Something is wrong?", style: theme.textTheme.labelLarge!.copyWith()),
            const SizedBox(width: PredefinedPadding.small),
            TextButton(
              onPressed: () {},
              child: const Text("Please contact us"),
            ),
          ],
        ),
      ],
    );
  }
}

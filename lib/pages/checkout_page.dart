import 'package:flutter/material.dart';
import 'package:thefitness1gym/values/predefined_radius.dart';
import 'package:thefitness1gym/widgets/checkout_widgets/payment_method.dart';
import '../values/predefined_padding.dart';
import '../widgets/page_title.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const CheckoutPage());

  @override
  State<CheckoutPage> createState() => _CheckoutPage();
}

class _CheckoutPage extends State<CheckoutPage> {
  _CheckoutPage();
  int? _selectedRadioButton = -1;

  static const horizontalPaddingSize = PredefinedPadding.medium;
  final codeController = TextEditingController();

  final padsm = const SizedBox(height: PredefinedPadding.small);
  final pad = const SizedBox(height: PredefinedPadding.regular);

  @override
  Widget build(BuildContext context) {
    bool selectedPayment = _selectedRadioButton! >= 0;

    final theme = Theme.of(context);
    final titleStyle =
        theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        centerTitle: true,
        title: const PageTitle("Checkout"),
      ),
      body: padded(
        Column(
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
                Text('Payment method', style: titleStyle),
                pad,
                pad,
                paymentMethodSection(theme),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: selectedPayment ? () {} : null,
                    style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary),
                    child: Text('Continue'.toUpperCase(),
                        style: theme.textTheme.bodyLarge!.copyWith(
                            color: selectedPayment ? Colors.black : Colors.white30, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
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
                  Text(
                    '1 Month Membership Package',
                    style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.secondary),
                  ),
                  const Text('200 AED')
                ],
              ),
            ),
          ),
        ),
        padsm,
        Text(
          'Discount 15%',
          style: theme.textTheme.labelMedium!.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600),
        ),
        padsm,
        padsm,
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Total:',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: theme.colorScheme.secondary, fontWeight: FontWeight.w600),
              ),
              const WidgetSpan(
                  child: SizedBox(
                width: PredefinedPadding.smallX,
              )),
              TextSpan(
                text: '200 AED',
                style:
                    theme.textTheme.bodyLarge!.copyWith(decoration: TextDecoration.lineThrough, color: Colors.white38),
              ),
              const WidgetSpan(
                  child: SizedBox(
                width: PredefinedPadding.smallX,
              )),
              TextSpan(
                text: '150AED',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: theme.colorScheme.secondary, fontWeight: FontWeight.w600),
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
              title: 'Using your Credit/Debit Card',
              onPressed: () {
                setState(() {
                  _selectedRadioButton = 0;
                });
              },
              isPressed: _selectedRadioButton == 0, // TODO: add a state to the payment method
            ),
            padsm,
            PaymentMethodButton(
              primary: false,
              theme: theme,
              icon: Icons.location_on_outlined,
              title: 'Directly at our branch',
              onPressed: () {
                setState(() {
                  _selectedRadioButton = 1;
                });
              },
              isPressed: _selectedRadioButton == 1,
            ),
          ],
        ),
        pad,
        pad,
        Row(
          children: [
            Text('Something is wrong?', style: theme.textTheme.labelLarge!.copyWith()),
            const SizedBox(
              width: PredefinedPadding.small,
            ),
            Text(
              'Please contact us',
              style: theme.textTheme.labelLarge!.copyWith(color: theme.colorScheme.primary),
            ),
          ],
        ),
      ],
    );
  }
}

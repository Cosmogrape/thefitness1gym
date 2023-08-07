import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';

import 'home_page.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const OtpVerifyPage());

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(fontSize: 20, color: Colors.amber, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(PredefinedPadding.small));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        title: Text(
          'Verify your phone',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: PredefinedPadding.big + 100,
            ),
            Column(
              children: [
                Text(
                  'Verify your\n Phone number',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your OTP code here',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: PredefinedPadding.large),
            Pinput(
              onCompleted: (pin) async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              length: 4,
              defaultPinTheme: defaultPinTheme,
            ),
            const SizedBox(height: PredefinedPadding.large),
            Text(
              "Didn't receive any code?",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: PredefinedPadding.small),
            Text(
              "RESEND A NEW CODE",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
            )
          ],
        ),
      )),
    );
  }
}

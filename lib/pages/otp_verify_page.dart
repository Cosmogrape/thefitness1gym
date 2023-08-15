import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:thefitness1gym/values/predefined_padding.dart';

import 'home_page.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const OtpVerifyPage());

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  late Timer timer;
  int resendTimeRemaining = 15;
  bool get canResend => resendTimeRemaining == 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (resendTimeRemaining > 0) {
        setState(() => resendTimeRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: PredefinedPadding.big + 100,
                ),
                Column(
                  children: [
                    Text(
                      'Phone number\nverification',
                      style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: PredefinedPadding.regular),
                    Text(
                      "Enter your OTP code here",
                      style: theme.textTheme.bodyMedium,
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
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: PredefinedPadding.small),
                TextButton(
                  onPressed: !canResend
                      ? null
                      : () {
                          //
                        },
                  child: Text(
                    canResend ? "RESEND A NEW CODE" : "(Please wait ${resendTimeRemaining}s to resend)",
                  ),
                ),
                const SizedBox(height: PredefinedPadding.large),
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: const Text("Change phone number"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

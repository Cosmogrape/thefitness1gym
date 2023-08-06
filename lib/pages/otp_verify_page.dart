import 'package:flutter/material.dart';

import 'home_page.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const OtpVerifyPage());

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: TextButton(
        onPressed: () {
          Navigator.of(context).push(HomePage.route);
        },
        child: const Text("Go to home (placeholder"),
      ),
    );
  }
}

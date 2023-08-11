import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/assets/values/predefined_radius.dart';

import '../widgets/fitness1_title.dart';
import 'otp_verify_page.dart';

@immutable
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static MaterialPageRoute get route => MaterialPageRoute(builder: (context) => const SignupPage());

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool nextEnabled = false;
  bool splashEnd = false;
  bool onPhoneNumber = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1, milliseconds: 200), () {
      setState(() => splashEnd = true);
    });
  }

  final myController = TextEditingController();

  signInChildren() {
    return [
      ElevatedButton(
        onPressed: () {
          // Navigator.of(context).push(PhoneAuthPage.route);
          setState(() {
            onPhoneNumber = true;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        ),
        child: const Text(
          'Phone number',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: PredefinedPadding.small),
      ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white12),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        ),
        child: const Text(
          'Fingerprint ID',
          style: TextStyle(color: Colors.white38),
        ),
      ),
    ];
  }

  phoneAuthChildren() {
    return [
      ClipRRect(
        borderRadius: BorderRadius.circular(PredefinedRadius.regular),
        child: TextFormField(
          controller: myController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'Enter your phone number',
            filled: true,
            fillColor: Colors.white10,
            contentPadding:
                EdgeInsets.symmetric(vertical: PredefinedPadding.small, horizontal: PredefinedPadding.medium),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
      const SizedBox(height: PredefinedPadding.medium),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(OtpVerifyPage.route);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(PredefinedRadius.regular),
            ),
          ),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        ),
        child: const Text(
          'Send OTP',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      )
    ];
  }

  heading(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Fitness1Title(),
          Text(
            'Unleash Your Greatness Today!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  contentTitle() {
    return Row(children: [
      Container(
          child: onPhoneNumber
              ? BackButton(onPressed: () {
                  setState(() {
                    onPhoneNumber = false;
                  });
                  myController.text = '';
                })
              : null),
      Text(
        onPhoneNumber ? 'Verify phone' : 'Sign in',
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      )
    ]);
  }

  content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contentTitle(),
        const SizedBox(height: 10),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54,
            ),
            width: double.infinity,
            child: Column(
              children: onPhoneNumber ? phoneAuthChildren() : signInChildren(),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          opacity: 0.6,
          image: AssetImage('lib/assets/images/hot_man.png'),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [heading(context), content()],
              ),
            ),
          )),
    );
  }
}

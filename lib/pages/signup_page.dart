import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_padding.dart';
import 'package:thefitness1gym/assets/values/predefined_radius.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';
import 'package:thefitness1gym/global/color_extension.dart';

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
  bool onPhoneNumber = false;

  final textEditingController = TextEditingController();

  Widget signIn(ThemeData theme) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() => onPhoneNumber = true);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(theme.colorScheme.primary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(PredefinedRadius.regular),
              ),
            ),
            minimumSize: MaterialStateProperty.all(const Size.fromHeight(PredefinedSize.buttonHeight)),
          ),
          child: const Text(
            'Phone number',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: PredefinedPadding.big),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(theme.colorScheme.surface),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(PredefinedRadius.regular),
              ),
            ),
            minimumSize: MaterialStateProperty.all(const Size.fromHeight(PredefinedSize.buttonHeight)),
          ),
          child: const Text(
            'Fingerprint ID',
            style: TextStyle(color: Colors.white38),
          ),
        ),
      ],
    );
  }

  Widget phoneAuth(ThemeData theme) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(PredefinedRadius.regular),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Enter your phone number',
              filled: true,
              fillColor: theme.colorScheme.secondary.withBrightness(.1),
              contentPadding: const EdgeInsets.symmetric(vertical: PredefinedPadding.small, horizontal: PredefinedPadding.medium),
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
            minimumSize: MaterialStateProperty.all(const Size.fromHeight(PredefinedSize.buttonHeight)),
          ),
          child: Text(
            'Send OTP',
            style: TextStyle(color: theme.colorScheme.background, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget heading(BuildContext context) {
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

  Widget content(ThemeData theme) {
    const duration = Duration(milliseconds: 200);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contentTitle(theme),
        const SizedBox(height: PredefinedPadding.regular),
        AnimatedSize(
          duration: duration,
          curve: Curves.ease,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: PredefinedPadding.regular, horizontal: PredefinedPadding.medium),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(PredefinedRadius.medium),
              color: theme.colorScheme.surface.withOpacity(.75),
            ),
            width: double.infinity,
            child: AnimatedCrossFade(
              duration: duration,
              firstChild: signIn(theme),
              secondChild: phoneAuth(theme),
              crossFadeState: onPhoneNumber ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              children: [heading(context), content(theme)],
            ),
          ),
        ),
      ),
    );
  }
}

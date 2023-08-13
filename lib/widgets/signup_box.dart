import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/home_page.dart';

class SignupBox extends StatefulWidget {
  const SignupBox({this.signin = false, super.key});

  final bool signin;

  @override
  State<SignupBox> createState() => _SignupBoxState();
}

enum SignupStep {
  name,
  email,
  password,
}

enum SigninStep {
  email,
  password,
}

class _SignupBoxState extends State<SignupBox> {
  int index = 0;
  bool nextEnabled = false;
  bool get isLastStep => index == 2;
  bool get isBackEnabled => index > 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const animationDuration = Duration(milliseconds: 500);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Become a member",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: animationDuration,
              transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
              child: index == 1
                  ? const Text("Enter your email")
                  : index == 2
                      ? const Text("Enter your password")
                      : const Text("Enter your name"),
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Name",
              ),
              onChanged: (value) => setState(() => nextEnabled = value.isNotEmpty),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  opacity: isBackEnabled ? 1 : 0,
                  duration: animationDuration,
                  child: IconButton(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.secondary,
                    ),
                    onPressed: () {
                      //? keep the function so the button doesn't look bad while hiding (don't let it become "disabled" and greyed out)
                      if (isBackEnabled) setState(() => index--);
                    },
                    icon: const Icon(FontAwesomeIcons.circleArrowLeft),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton.icon(
                  icon: const Icon(FontAwesomeIcons.circleArrowRight),
                  label: AnimatedSwitcher(
                    duration: animationDuration,
                    child: isLastStep ? const Text("Finish") : const Text(" Next "),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: nextEnabled
                        ? (isLastStep ? theme.colorScheme.primary : theme.colorScheme.secondary)
                        : theme.colorScheme.secondary.withOpacity(.5),
                    foregroundColor: isLastStep ? theme.colorScheme.onPrimary : theme.colorScheme.onSecondary,
                  ),
                  onPressed: nextEnabled
                      ? () => setState(
                            () {
                              if (!isLastStep) {
                                index++;
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage()));
                              }
                            },
                          )
                      : null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

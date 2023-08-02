import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/fitness1_title.dart';

@immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  bool nextEnabled = false;
  bool get splashEnd => index > 0;
  bool get isLastStep => index == 3;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1, milliseconds: 200), () {
      setState(() => index = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const animationDuration = Duration(milliseconds: 500);
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: splashEnd ? 0 : 1,
            duration: animationDuration,
            child: const Center(child: Fitness1Title()),
          ),
          AnimatedScale(
            scale: splashEnd ? 1 : .95,
            duration: animationDuration,
            child: Center(
              child: AnimatedOpacity(
                opacity: splashEnd ? 1 : 0,
                duration: animationDuration,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Become a member",
                          style: theme.textTheme.headlineSmall!.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AnimatedSwitcher(
                          duration: animationDuration,
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
                              opacity: index > 1 ? 1 : 0,
                              duration: animationDuration,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: theme.colorScheme.secondary,
                                ),
                                child: const Text("Back"),
                                onPressed: () => setState(() {
                                  if (index > 1) index--;
                                }),
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
                              onPressed: () => setState(() {
                                if (!isLastStep) index++;
                              }),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

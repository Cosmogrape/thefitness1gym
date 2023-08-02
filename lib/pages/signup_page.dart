import 'package:flutter/material.dart';
import 'package:thefitness1gym/widgets/signup_box.dart';

import '../widgets/fitness1_title.dart';

@immutable
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool nextEnabled = false;
  bool splashEnd = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1, milliseconds: 200), () {
      setState(() => splashEnd = true);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                child: const SignupBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

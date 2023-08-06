import 'package:flutter/material.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:thefitness1gym/widgets/signup_box.dart';

import '../widgets/fitness1_title.dart';
import 'phone_auth_page.dart';

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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1, milliseconds: 200), () {
      setState(() => splashEnd = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(alignment: Alignment.centerLeft, child: const Fitness1Title()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sign in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white12,
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          // Container(
                          //   width: 200,
                          //   height: 40,
                          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.amber),
                          //   child: Center(
                          //     child: Text(
                          //       'Phone number',
                          //       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          // ),
                          ElevatedButton(
                            onPressed: () {
                              print('Phone number login');
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => PhoneNumberAuthScreen()));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.amber),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                            ),
                            child: const Text(
                              'Phone number',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // const SizedBox(height: 10),
                          // Should be disabled
                          // Container(
                          //   width: 200,
                          //   height: 40,
                          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white38),
                          // )
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

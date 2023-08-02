import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thefitness1gym/widgets/signup_box.dart';

import '../widgets/fitness1_title.dart';

@immutable
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Hi');
  }
}

class PhoneNumberAuthScreen extends StatelessWidget {
  PhoneNumberAuthScreen({super.key});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        print('Back');
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Enter your phone number',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 14, 30, 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white12,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter your phone number',
                          filled: true,
                          fillColor: Colors.white10,
                        ),
                      ),
                      SizedBox(height: 14),
                      ElevatedButton(
                        onPressed: () {
                          print(myController.text);
                          // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OtpVerificationPage()));
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => FocusScope.of(context).unfocus(),
    );
  }
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
                      padding: EdgeInsets.fromLTRB(30, 14, 30, 14),
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

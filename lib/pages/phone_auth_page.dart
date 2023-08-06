import 'package:flutter/material.dart';
import 'package:thefitness1gym/assets/values/predefined_size.dart';

class PhoneNumberAuthScreen extends StatelessWidget {
  PhoneNumberAuthScreen({super.key});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: const BackButton(),
          title: const Text("Signup"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(PredefinedSize.paddingBig),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white12,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TextFormField(
                          controller: myController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter your phone number',
                            filled: true,
                            fillColor: Colors.white10,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 14),
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
                          'Continue',
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
    );
  }
}

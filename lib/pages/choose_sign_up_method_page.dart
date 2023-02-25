import 'package:firebase_authentication/pages/phone_sign_in_page.dart';
import 'package:firebase_authentication/pages/register_page.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseSignUpMethodPage extends StatelessWidget {
  const ChooseSignUpMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        title: const Text('Choose your method'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Choose your preferred way to sign up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Email and Password',
                function: () {
                  Get.to(const RegisterPage());
                },
              ),
              CustomButton(
                text: 'Phone Number',
                function: () {
                  Get.to(const PhoneSignInPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

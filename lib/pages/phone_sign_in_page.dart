import 'package:firebase_authentication/getx/controller/sign_up_controller.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:firebase_authentication/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneSignInPage extends StatelessWidget {
  const PhoneSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        title: const Text('Phone SignIn'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: controller.phoneNumber,
                  textInputType: TextInputType.number,
                  hintText: 'Enter Your Phone Number',
                  isPassword: false,
                  icon: const Icon(Icons.phone_android_outlined),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        controller
                            .phoneSignIn(controller.phoneNumber.text.trim());
                        // SignUpController.instance.registerUser(
                        //     controller.email.text.trim(),
                        //     controller.password.text.trim());
                      }
                    },
                    text: 'Sign In'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

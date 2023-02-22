import 'package:firebase_authentication/getx/controller/sign_up_controller.dart';
import 'package:firebase_authentication/pages/phone_sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                    label: Text('Enter your email'),
                    prefix: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.password,
                  decoration: const InputDecoration(
                    label: Text('Enter your password'),
                    prefix: Icon(Icons.password),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.registerUser(controller.email.text.trim(),
                          controller.password.text.trim());
                      // SignUpController.instance.registerUser(
                      //     controller.email.text.trim(),
                      //     controller.password.text.trim());
                    }
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.logUserIn(controller.email.text.trim(),
                          controller.password.text.trim());
                      // SignUpController.instance.registerUser(
                      //     controller.email.text.trim(),
                      //     controller.password.text.trim());
                    }
                  },
                  child: const Text('Log In'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Get.offAll(() => const PhoneSignInPage());
                  },
                  child: const Text('Phone Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

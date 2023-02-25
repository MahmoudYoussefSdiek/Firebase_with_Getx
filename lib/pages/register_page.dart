import 'package:firebase_authentication/getx/controller/sign_up_controller.dart';
import 'package:firebase_authentication/pages/log_in_page.dart';
import 'package:firebase_authentication/pages/otp_page.dart';
import 'package:firebase_authentication/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
                  CustomTextField(
                    controller: controller.email,
                    hintText: 'Enter Your Email',
                    isPassword: false,
                    textInputType: TextInputType.emailAddress,
                    icon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: controller.password,
                    hintText: 'Enter your Password',
                    textInputType: TextInputType.text,
                    isPassword: true,
                    icon: const Icon(Icons.password_outlined),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.registerUser(controller.email.text.trim(),
                              controller.password.text.trim());
                          // SignUpController.instance.registerUser(
                          //     controller.email.text.trim(),
                          //     controller.password.text.trim());
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(12),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        ' Have an account ? ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => const LogInPage());
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            // color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const OTPPage());
                    },
                    child: const Text(
                      'OTP page',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

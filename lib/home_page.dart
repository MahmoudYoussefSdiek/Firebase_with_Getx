import 'package:firebase_authentication/getx/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to home page'),
            ElevatedButton(
              onPressed: () {
                // SignUpController.instance.logOut();
                controller.logOut();
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}

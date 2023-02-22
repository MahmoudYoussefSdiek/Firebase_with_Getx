import 'package:firebase_authentication/firebase/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  // Phone Sign In. take phone number from UI
  phoneSignIn(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }

  // SignUp Method (register). take email and password from UI
  registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  // Log In. take email and password from UI
  logUserIn(String email, String password) {
    AuthenticationRepository.instance
        .logInUserWithEmailAndPassword(email, password);
  }

  // Log Out
  logOut() {
    AuthenticationRepository.instance.logOut();
  }
}

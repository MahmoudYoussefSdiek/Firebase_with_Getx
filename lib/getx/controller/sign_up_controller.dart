import 'package:firebase_authentication/firebase/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  // SignUp Method (register)
  registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  logOut() {
    AuthenticationRepository.instance.logOut();
  }
}

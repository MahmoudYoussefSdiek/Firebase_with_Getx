import 'package:firebase_authentication/firebase/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    await AuthenticationRepository.instance.verifyOTP(otp);
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/firebase/exceptions/signup_email_password_failure.dart';
import 'package:firebase_authentication/home_page.dart';
import 'package:firebase_authentication/sign_page.dart';
import 'package:get/get.dart';

// here we will register to firebase using GetX as StateManagement

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  // here we use this call in start of app to initialize variables
  @override
  void onReady() {
    super.onReady();
    // we make it stream (firebaseUser)
    firebaseUser = Rx<User?>(_auth.currentUser);
    // we listen to firebase changes on user form (userChanges())
    // method comes from firebase
    firebaseUser.bindStream(_auth.userChanges());
    // here we say what ever change on stream (firebaseUser) we do something (_setInitialScreen)
    ever(firebaseUser, _setInitialScreen);
  }

  // route page based on user exists or no
  _setInitialScreen(User? user) {
    // here we check user if exists or no
    // Get.offAll() to clear all pages and return a new page
    user == null
        ? Get.offAll(() => const SignPage())
        : Get.offAll(() => const HomePage());
  }

  // here we will register user to firebase
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // firebaseUser.value != null
      //     ? Get.offAll(() => const HomePage())
      //     : Get.offAll(() => const SignPage());
    } on FirebaseAuthException catch (e) {
      final exception = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase auth exception : ${exception.message} ');
      throw exception;
    } catch (_) {
      const exception = SignUpWithEmailAndPasswordFailure();
      print('Firebase auth exception : ${exception.message} ');
      throw exception;
    }
  }

  // here to make user log in
  Future<void> logInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (_) {
    } catch (_) {}
  }

  // here we will logout user
  Future<void> logOut() async => await _auth.signOut();
}

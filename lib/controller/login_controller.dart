import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom/custom_botombar.dart';
import '../services/internet.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = false;

  Future<void> login() async {
    // ignore: unrelated_type_equality_checks
    if (checkNetwork() != ConnectivityResult.none) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.toString(), password: password.text.toString());
        debugPrint("Successfully logged in");
        Get.offAll(() => const CustomBotomBar());
        Get.snackbar('Successfully', 'Login User', backgroundColor: const Color.fromARGB(255, 194, 118, 113));
      } on FirebaseAuthException catch (e) {
        debugPrint("Firebase Authentication Error: ${e.code}, ${e.message}");
        Get.snackbar('Error', e.message.toString(), backgroundColor: const Color.fromARGB(255, 194, 118, 113));
      }
    } else {
      Get.snackbar('Error', 'No internet connection', backgroundColor: const Color.fromARGB(255, 194, 118, 113));
    }
  }
}

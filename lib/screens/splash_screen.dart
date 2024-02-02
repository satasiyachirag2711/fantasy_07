import 'package:fantasy_07/custom/custom_botombar.dart';
import 'package:fantasy_07/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;

    Future.delayed(const Duration(seconds: 2), () {
      if (user != null && user!.uid.isNotEmpty) {
        Get.off(const CustomBotomBar());
      } else {
        Get.off(const WelcomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/fantasy.png', height: Get.height * 0.16),
          ),
          Text(
            'Fantasy 07',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: Get.width * 0.085,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

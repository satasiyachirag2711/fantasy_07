import 'package:fantasy_07/screens/login_screen.dart';
import 'package:fantasy_07/screens/ragister_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
          Color.fromARGB(255, 131, 26, 19),
          Color.fromARGB(255, 187, 31, 20),
          Color.fromARGB(255, 131, 26, 19),
        ])),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.3),
                Image.asset('assets/images/fantasy.png', fit: BoxFit.cover, height: Get.height * 0.22),
                Text(
                  'Fantasy 07',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aclonica(
                    color: Colors.white,
                    fontSize: Get.width * 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Get.height * 0.2),
                Container(
                  width: Get.width,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 114, 38, 33),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    onPressed: () {
                      Get.to(const LoginScreen());
                    },
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Get.width * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: Get.width,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const RagisterScreen());
                    },
                    child: Center(
                      child: Text(
                        'Create an Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Get.width * 0.04,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Invited by a friend? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Enter code',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

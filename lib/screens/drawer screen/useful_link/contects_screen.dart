import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContectScreen extends StatelessWidget {
  const ContectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent.shade400,
          title: Text(
            'Contests',
            style: GoogleFonts.abyssinicaSil(
              color: Colors.white,
              fontSize: Get.width * 0.052,
            ),
          )),
      body: Image.asset("assets/images/contest.png"),
    );
  }
}

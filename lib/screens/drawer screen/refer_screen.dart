import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/internet.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent.shade400,
          title: Text(
            'Refer & Earn',
            style: GoogleFonts.abyssinicaSil(
              color: Colors.white,
              fontSize: Get.width * 0.052,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Your Referral Code", style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              Center(
                child: Container(
                  width: Get.width * 0.5,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(width: 5),
                      Text(userDetails["userRefNo"], style: GoogleFonts.actor(color: Colors.white, fontSize: Get.width * 0.044, fontWeight: FontWeight.bold)),
                      Container(
                        decoration: const BoxDecoration(color: Color.fromARGB(255, 10, 37, 59), borderRadius: BorderRadius.horizontal(right: Radius.circular(5))),
                        width: Get.width * 0.16,
                        height: Get.height * 0.1,
                        child: Center(
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    copy(userDetails["userRefNo"]);
                                  });
                                },
                                child: Text('Copy', style: TextStyle(color: Colors.white, fontSize: Get.width * 0.04)))),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  "assets/images/ref_screen.png",
                  width: Get.width,
                  fit: BoxFit.cover,
                  height: Get.height * 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void copy(String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    Get.snackbar("Copy", textToCopy, backgroundColor: Colors.green);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsibleScreen extends StatelessWidget {
  const ResponsibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent.shade400,
          title: Text(
            'Fantasy07',
            style: GoogleFonts.abyssinicaSil(
              color: Colors.white,
              fontSize: Get.width * 0.052,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.06, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Responsible Play',
                      style: GoogleFonts.aBeeZee(fontSize: Get.width * 0.08, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.width * 0.07, bottom: 20),
                    child: const Text(
                      'Responsible Play includes the following:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Transaction limit',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'You can add up to Rs. 25000/- to your Fantasy07 account at a time.',
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Alerts',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Notifying users about accumulated losses in a financial year through timely alerts.',
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Timeout',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'You can take a 15-day break from playing Cash Contests.',
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Age and Location Limits',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Cash Contests are only open to residents aged 18 and over. Residents from Assam,  Andhra Pradesh, Odisha, Telangana, Nagaland and Sikkim are not permitted to  join Cash Contests on Fantasy07.',
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 10, 37, 59),
              width: Get.width,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/fantasy.png",
                    width: 150,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'Fantasy07',
                    style: GoogleFonts.abyssinicaSil(
                      color: Colors.white,
                      fontSize: Get.width * 0.08,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

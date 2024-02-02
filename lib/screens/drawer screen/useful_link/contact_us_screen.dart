import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent.shade400,
          title: Text(
            'Contact & Us',
            style: GoogleFonts.abyssinicaSil(
              color: Colors.white,
              fontSize: Get.width * 0.052,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.04, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Talk to us',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(fontSize: Get.width * 0.075, color: const Color.fromARGB(255, 10, 37, 59), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Get the info you’re looking for right now",
                    style: GoogleFonts.alumniSans(height: 2, color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Colors.grey.shade300,
                      )),
                  Text(
                    "Headquaters",
                    style: GoogleFonts.actor(color: const Color.fromARGB(255, 10, 37, 59), fontSize: Get.width * 0.055, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.home,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Home No 3,Raghuvir Park,Nikol,Ahamdabad Gujarat 382350",
                            style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Call & Whatsapp",
                    style: GoogleFonts.actor(color: const Color.fromARGB(255, 10, 37, 59), fontSize: Get.width * 0.055, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.call,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "+91 7016060833",
                            style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Support",
                    style: GoogleFonts.actor(color: const Color.fromARGB(255, 10, 37, 59), fontSize: Get.width * 0.055, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "satasiyachirag314@gmail.com",
                            style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/contact_us.png"),
            const SizedBox(height: 30),
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

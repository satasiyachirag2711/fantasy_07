import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FreeGiveAwayScreen extends StatelessWidget {
  const FreeGiveAwayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent.shade400,
          title: Text(
            'Free & Giveaway',
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
                      'Free Giveaway Contest',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(fontSize: Get.width * 0.085, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome to  Fantasy07 Fantasy Cricket! We're excited to introduce our Free Giveaway contest, a fantastic opportunity for our users to participate using a 100% cash bonus.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.width * 0.07, bottom: 10),
                    child: Text(
                      'How It Works',
                      style: TextStyle(fontSize: Get.width * 0.07, color: const Color.fromARGB(255, 10, 37, 59), fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "Participation and Cash Bonus",
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Each user can enter the Free Giveaway contest once for each match. This means that one user can submit one team for each Free Giveaway contest related to a specific match. To enter, you can utilize your available cash bonus. This means you won't have to spend any of your real money to participate.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Aadhar Card Verification',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "As per KYC verification process, users are required to complete Aadhar card verification for participation in any contest. This is a part of our security and fairness measures.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Displayed Contest Prize',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "The contests displayed prize amount will be deducted from your Free cash bonus. This ensures that your cash bonus covers your entry, and you wont need to spend any real money.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Real Money Payout',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "If you win the Free Giveaway contest, your winnings can be easily withdrawn to your bank account. To facilitate this, users are required to complete full KYC for bank account payouts.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Taxes and TDS',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Applicable TDS or other taxes will be applied as per government rules on the winnings, ensuring compliance with legal requirements.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Why  Fantasy07?',
                    style: TextStyle(fontSize: Get.width * 0.07, color: const Color.fromARGB(255, 10, 37, 59), fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Quick Payouts',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Fantasy07 offers swift and hassle-free real money payouts, allowing you to enjoy your winnings without delay.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '100% Cash Bonus',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Our Free Giveaway contest is just one example of how we offer opportunities to use your cash bonus to win real money.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Fair and Transparent',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Fantasy07 is committed to a fair and transparent gaming experience for all users.",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "So, don't miss out on the chance to win real money without any financial risk. Join the Free Giveaway contest, have fun, and enjoy your winnings while following secure and compliant procedures. Remember, for each match, one user can enter one Free Giveaway contest with one team.",
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

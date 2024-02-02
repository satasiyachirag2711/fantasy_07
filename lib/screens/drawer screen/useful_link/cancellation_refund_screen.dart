import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CancellationRefundScreen extends StatelessWidget {
  const CancellationRefundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent.shade400,
          title: Text(
            'Cancellation & Refund',
            style: GoogleFonts.abyssinicaSil(
              color: Colors.white,
              fontSize: Get.width * 0.052,
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.04, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Cancellation/Refund Policy',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(fontSize: Get.width * 0.075, color: const Color.fromARGB(255, 10, 37, 59), fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "All deposits and purchases made and fees paid on  Fantasy07 to play or in connection with Fantasy Cricket are final. All transactions are final. We recognize that customer satisfaction is extremely important to us, so only error-oriented transaction cases shall be reviewed.If you are not fully satisfied with any deposit/purchase made or fee paid on  Fantasy07 and feel there is an 'Error’ in the transaction, please let us know about that within 3 days from the transaction date, and we shall certainly review the transaction and determine the resolution at our own discretion. Fantasy07 reserves the right to cancel any match(es) for any reason, with or without disclosure of the reason, and refund all fees paid for such matches by any and all users within 1-3 business days  Fantasy07 forbids Users from joining any game rooms after a match related to the game room (identified by the Series) has begun.",
                  style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 10, 37, 59),
              width: Get.width,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ],
      ),
    );
  }
}

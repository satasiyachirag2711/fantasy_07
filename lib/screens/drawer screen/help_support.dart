import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSupports extends StatefulWidget {
  const HelpSupports({super.key});

  @override
  State<HelpSupports> createState() => _HelpSupportsState();
}

class _HelpSupportsState extends State<HelpSupports> {
  final help = RxList<Map<String, dynamic>>(
    [
      {"title": "1. What is Fantasy07?", "subtitle": "Fantasy07 is an Indian fantasy sports platform that allows users to play Indian fantasy cricket online.", "data": false},
      {"title": "2. How to deposit money to play?", "subtitle": "Open Fantasy07 app -> Click on top right add cash button -> Click on Add cash -> Enter amount to add -> Select payment mode & deposit.", "data": false},
      {"title": "3. How do I withdraw my winnings?", "subtitle": "Click on the Manage Balance -> Go to withdraw -> Insert the amount you wish to withdraw from your winnings -> Click on the withdraw button (You can put a withdrawal request only if 1). Your Fantasy07 is verified 2). Winning amount Rs. 50 or more)", "data": false},
      {"title": "4. What is a cash bonus?", "subtitle": "Cash Bonus is given as a gift to Fantasy07 players. You can use it to join any public cash contests. It is valid for 11 days from the date it has been credited", "data": false},
      {"title": "5. How can I keep my Fantasy07 account safe?", "subtitle": "You can keep your account safe by never providing OTP, PAN card details, or Bank account details to anyone. Also, never install unauthorized applications. Fantasy07 never share cash bonus or any vouchers on any other platforms, also we do not share any email for the same.", "data": false},
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pinkAccent.shade400,
            title: Text(
              'Help & Support',
              style: GoogleFonts.abyssinicaSil(
                color: Colors.white,
                fontSize: Get.width * 0.052,
              ),
            )),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Image.asset("assets/images/help_support.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              help[index]["data"] = !help[index]["data"];
                              setState(() {});

                              debugPrint(help[index]["data"]);
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 0,
                              shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12, top: 15, bottom: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      help[index]["title"],
                                      style: GoogleFonts.aclonica(fontSize: Get.width * 0.04),
                                    ),
                                    help[index]["data"] == true
                                        ? Text(
                                            help[index]["subtitle"],
                                            style: GoogleFonts.acme(fontSize: Get.width * 0.04),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: help.length),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ));
  }
}

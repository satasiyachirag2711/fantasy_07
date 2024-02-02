import 'package:fantasy_07/screens/drawer%20screen/useful_link/about_us_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/cancellation_refund_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/contact_us_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/contects_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/fantasy_points_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/free_giveaway_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/legalitie_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/privacy_policy_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/responsible_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link/term_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UsefulScreen extends StatefulWidget {
  const UsefulScreen({super.key});

  @override
  State<UsefulScreen> createState() => _UsefulScreenState();
}

class _UsefulScreenState extends State<UsefulScreen> {
  final List<Map<String, dynamic>> links = [
    {'icon': Icons.privacy_tip, 'title': 'Privacy Policy'},
    {'icon': Icons.description, 'title': 'Terms and Conditions'},
    {'icon': Icons.info_outline, 'title': 'About Us'},
    {'icon': Icons.contact_mail, 'title': 'Contest'},
    {'icon': Icons.gavel, 'title': 'Legality'},
    {'icon': Icons.stars, 'title': 'Fantasy Points'},
    {'icon': Icons.policy, 'title': 'Responsible Play'},
    {'icon': Icons.verified, 'title': 'Free Giveaway'},
    {'icon': Icons.contact_mail, 'title': 'Contact Us'},
    {'icon': Icons.lock_reset_sharp, 'title': 'Cancellation/Refund'},
  ];
  List screen = [
    () => const PrivacyPolicyScreen(),
    () => const TermConditionScreen(),
    () => const AboutUsScreen(),
    () => const ContectScreen(),
    () => const LegalitieScreen(),
    () => const FantasyPointScreen(),
    () => const ResponsibleScreen(),
    () => const FreeGiveAwayScreen(),
    () => const ContactUsScreen(),
    () => const CancellationRefundScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent.shade400,
          title: Text(
            'Useful & Links',
            style: GoogleFonts.abyssinicaSil(
              color: Colors.white,
              fontSize: Get.width * 0.052,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: links.length,
                  itemBuilder: (context, index) => Card(
                        shadowColor: Colors.blueGrey,
                        color: Colors.white,
                        child: ListTile(
                          onTap: () => Get.to(screen[index]),
                          leading: Icon(links[index]['icon']),
                          title: Text(links[index]['title']),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}

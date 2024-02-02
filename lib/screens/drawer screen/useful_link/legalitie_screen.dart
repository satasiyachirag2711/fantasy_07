import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LegalitieScreen extends StatelessWidget {
  const LegalitieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent.shade400,
          title: Text(
            'Legalities',
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
                      'Legalities',
                      style: GoogleFonts.aBeeZee(fontSize: Get.width * 0.085, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.042),
                    child: Text(
                      'Game of Skills',
                      style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Fantasy07 is considered as a "Game of Skill." The game of skills can be defined as a game wherein the skills of the individuals participating in any online fantasy sports gaming play a dominant role rather than the mere luck of the individuals. The individuals in game of skills use their  knowledge, skills, training and attention for participation and winning.  Online fantasy sports gaming is considered to be a legal practice around the world with certain states being an exception. Online fantasy sports gaming is entirely based on the concept of Game of Skills, wherein the users form their own teams. and are allocated points on the basis of on-field performance of their chosen players.  Fantasy07 is completely legal as it offers services, Fun Features, Program(s) and Contest(s) related to fantasy cricket. The services, contest(s) and program(s) related to online fantasy sports gaming offered by Fantasy07 enables its users to create their own team prior the match begins and then the teams are awarded points on the basis of the real-life performance of the players chosen by the users in the team. The individual whose team scores the highest aggregate of points is announced as the winner. The formation of team by the users of Fantasy07. is entirely dependent on the skills, knowledge and attention of the users which makes online fantasy sports gaming offered at Fantasy07. a game of skills and 100% legal.',
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Allignment With The Indian Laws',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "The game of skills such as the online fantasy sports gaming are considered to be legal all over India, expect certain states such as Sikkim, Assam, Odisha, Telangana and Nagaland. The Public Gambling Act, 1867 (PGA, 1867) is recognized as the primary legality driving the prevalence of gambling in India  The PGA defines the act of public gambling and the keeping of a common gaming house as a criminal and punishable act in India, However, the online fantasy sports gaming is considered to be an exception under the PGA, wherein the provisions and punishments of PGA shall not be applicable to games played by the user using their skills and knowledge as primary tools",
                    style: GoogleFonts.alumniSans(color: Colors.black45, fontSize: Get.width * 0.042, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sikkim, Assam, Odisha, Telangana, Andhra Pradesh and Nagaland',
                    style: GoogleFonts.actor(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "There are various states in India wherein the laws related to the game of skills are unclear. In this regard, for the websites offering online fantasy sports gaming, it remains unclear whether to offer the services for free or not. The Indian states with no clearance regarding the offering of pay-to-play contests include Sikkim, Assam, Odisha, Telangana, Andhra Pradesh and Nagaland.  In this context. Fantasy07 does not permit the user identified as the residents of Sikkim, Odisha, Telangana, Andhra Pradesh, Assam andNagaland to participate in the pay-to-playcontest(s) organized by Fantasy07.",
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

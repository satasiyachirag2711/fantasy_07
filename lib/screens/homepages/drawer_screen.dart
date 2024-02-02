import 'package:fantasy_07/controller/home_controller.dart';
import 'package:fantasy_07/screens/drawer%20screen/help_support.dart';
import 'package:fantasy_07/screens/drawer%20screen/refer_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/useful_link_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/verify_screen.dart';
import 'package:fantasy_07/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/internet.dart';
import '../drawer screen/edit_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Drawer(
        width: Get.width * 0.75,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: Get.height * 0.03),
              height: Get.height * 0.15,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 10, 37, 59),
              ),
              child: Center(
                child: ListTile(
                  onTap: () {
                    Get.to(() => const EditProfile());
                  },
                  horizontalTitleGap: 5,
                  leading: SizedBox(
                    height: Get.height * 0.07,
                    width: Get.width * 0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Get.width),
                      child: userDetails["imageUrl"] == null
                          ? Image.asset("assets/images/profile.png")
                          : Image.network(
                              userDetails["imageUrl"],
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  title: Text(
                    userDetails["name"].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  subtitle: Text(
                    userDetails["email"].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 40, color: Colors.white),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  index == 1
                      ? Get.to(const ReferEarnScreen())
                      : index == 2
                          ? Get.to(const VerifyScreen())
                          : index == 4
                              ? Get.to(const UsefulScreen())
                              : index == 5
                                  ? Get.to(const HelpSupports())
                                  : const SizedBox();
                  if (index == 0) {
                    Get.back();
                    homeController.index(2);
                  }
                },
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: Icon(homeController.drList[index]["icon"]),
                  ),
                  Text(
                    '${homeController.drList[index]['Text']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                  ),
                ]),
              ),
              separatorBuilder: (context, index) => const Divider(indent: 60),
              itemCount: homeController.drList.length,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () async {
                        await logOut();
                      },
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Icon(
                            Icons.exit_to_app,
                            size: Get.width * 0.05,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          'Log Out',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: Get.width * 0.04),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Future logOut() async {
    FirebaseAuth.instance.signOut().then((value) => Get.offAll(() => const WelcomeScreen()));
  }
}

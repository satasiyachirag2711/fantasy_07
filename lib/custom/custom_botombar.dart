// ignore_for_file: deprecated_member_use

import 'package:fantasy_07/controller/home_controller.dart';
import 'package:fantasy_07/screens/homepages/home_screen.dart';
import 'package:fantasy_07/screens/matches/my_matches_screen.dart';
import 'package:fantasy_07/screens/wallet/wallet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/homepages/drawer_screen.dart';
import '../screens/homepages/notification_screen.dart';
import '../services/internet.dart';

class CustomBotomBar extends StatefulWidget {
  const CustomBotomBar({Key? key}) : super(key: key);

  @override
  State<CustomBotomBar> createState() => _CustomBotomBarState();
}

class _CustomBotomBarState extends State<CustomBotomBar> {
  List data = [const HomeScreen(), const MyMatchesScreen(), const WalletScreen()];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          // If the bottom sheet is open, close it
          Navigator.of(context).pop();
          return false;
        } else {
          showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text("Do you went to exits?"),
              content: const Text("Are you sure you want to exits?"),
              actions: [
                CupertinoDialogAction(
                    child: const Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    }),
                CupertinoDialogAction(
                    child: const Text("NO"),
                    onPressed: () {
                      Get.back();
                    })
              ],
            ),
          );
          return false;
        }
      },
      child: Obx(() {
        return Scaffold(
          key: scaffoldKey,
          drawer: const DrawerScreen(),
          appBar: AppBar(
            centerTitle: true,
            leading: Obx(() {
              return IconButton(
                  onPressed: () => scaffoldKey.currentState?.openDrawer(),
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(Get.width),
                    child: userDetails["imageUrl"] == null
                        ? Image.asset("assets/images/profile.png")
                        : Image.network(
                            userDetails["imageUrl"],
                            fit: BoxFit.fill,
                          ),
                  ));
            }),
            title: Text(
              homeController.index.value == 0
                  ? 'Fantasy 07'
                  : homeController.index.value == 1
                      ? "My Matches"
                      : "Manage Balance",
              style: GoogleFonts.abyssinicaSil(
                fontSize: homeController.index.value == 0 ? 30 : 25,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red.shade900,
            actions: [
              homeController.index.value == 0
                  ? IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.to(() => const NotificationScreen());
                      },
                    )
                  : const SizedBox(),
            ],
          ),
          body: data[homeController.index.value],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: homeController.index.value,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            onTap: (int tappedIndex) {
              setState(() {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();

                  if (tappedIndex == 3) {
                    // If the tapped index is 3 (Account), open the drawer
                    scaffoldKey.currentState?.openDrawer();
                  } else {
                    homeController.index.value = tappedIndex;
                  }
                }
                if (tappedIndex == 3) {
                  // If the tapped index is 3 (Account), open the drawer
                  scaffoldKey.currentState?.openDrawer();
                } else {
                  homeController.index.value = tappedIndex;
                }
              });
            },
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/trophy.png",
                    scale: 12,
                    color: homeController.index.value == 1 ? Colors.red : Colors.black,
                  ),
                  label: "My Matches"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/wallet.png",
                    scale: 12,
                    color: homeController.index.value == 2 ? Colors.red : Colors.black,
                  ),
                  label: "Wallet"),
              const BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Account"),
            ],
          ),
        );
      }),
    );
  }
}

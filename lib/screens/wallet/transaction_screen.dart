import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/internet.dart';
import '../homepages/drawer_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    userData();
    fetchData(); // Some function that calls userTransactions
    super.initState();
  }

  Future<void> fetchData() async {
    await userTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.grey.shade400,
        key: scaffoldKey,
        drawer: const DrawerScreen(),
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(Get.width),
                child: userDetails["imageUrl"] == null
                    ? Image.asset("assets/images/profile.png")
                    : Image.network(
                        userDetails["imageUrl"],
                        fit: BoxFit.fill,
                      ),
              )),
          title: Text(
            "My Transactions",
            style: GoogleFonts.abyssinicaSil(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red.shade900,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(children: [
                Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Available Balance",
                        style: GoogleFonts.akshar(color: Colors.white, fontSize: Get.width * 0.06),
                      ),
                      Text(
                        "\u{20B9}${userDetails["balance"]}",
                        style: GoogleFonts.abyssinicaSil(fontWeight: FontWeight.bold, color: Colors.white, fontSize: Get.width * 0.09),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transition History",
                          style: GoogleFonts.akshar(color: Colors.white, fontSize: Get.width * 0.06),
                        ),
                        const Divider(),
                        userTransaction.isNotEmpty
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: userTransaction[index]["title"] == "Add Money"
                                        ? Image.asset("assets/images/addmoney.png", scale: 5)
                                        : userTransaction[index]["title"] == "WithDraw Amount"
                                            ? Image.asset("assets/images/withdraw.png", scale: 16)
                                            : Image.asset("assets/images/bonus.png", color: Colors.white, scale: 12),
                                  ),
                                  title: Text(userTransaction[index]["title"], style: GoogleFonts.akshar(fontSize: Get.width * 0.04, color: Colors.white)),
                                  subtitle: Text(userTransaction[index]["subtitle"], style: GoogleFonts.akshar(fontSize: Get.width * 0.036, color: Colors.white54)),
                                  trailing: userTransaction[index]["title"] == "WithDraw Amount"
                                      ? Text("- ${userTransaction[index]["amount"]}", style: GoogleFonts.akshar(color: Colors.red, fontWeight: FontWeight.bold, fontSize: Get.width * 0.04))
                                      : Text("+ ${userTransaction[index]["amount"]}", style: GoogleFonts.akshar(color: Colors.green.shade500, fontWeight: FontWeight.bold, fontSize: Get.width * 0.04)),
                                ),
                                itemCount: userTransaction.length,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}

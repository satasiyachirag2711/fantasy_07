import 'package:fantasy_07/controller/wallet_controller.dart';
import 'package:fantasy_07/screens/drawer%20screen/refer_screen.dart';
import 'package:fantasy_07/screens/wallet/add_cash.dart';
import 'package:fantasy_07/screens/wallet/transaction_screen.dart';
import 'package:fantasy_07/screens/wallet/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/internet.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final wallet = Get.put(WalletController());

  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Balance',
                          style: GoogleFonts.actor(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '(Ammout Added + Winnings)',
                          style: GoogleFonts.actor(color: Colors.black38, fontSize: Get.width * 0.04, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\u{20B9}${userDetails["balance"]}',
                          style: GoogleFonts.abel(color: Colors.green, fontSize: Get.width * 0.08, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  wallet.addAmount.clear();
                                  showBottomSheet(context: context, builder: (context) => const AddCashScreen());
                                },
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade900), elevation: const MaterialStatePropertyAll(4), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
                                child: const Text("Add Cash", style: TextStyle(color: Colors.white))),
                            const SizedBox(width: 20),
                            ElevatedButton(
                                onPressed: () {
                                  wallet.withdrawAmount.clear();
                                  showBottomSheet(context: context, builder: (context) => const WithdrawScreen());
                                },
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade900), elevation: const MaterialStatePropertyAll(4), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
                                child: const Text("Verify WithDraw", style: TextStyle(color: Colors.white))),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Deposited',
                              style: GoogleFonts.actor(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\u{20B9}${userDetails["deposit"]}',
                              style: TextStyle(fontSize: Get.width * 0.055, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Winnings',
                              style: GoogleFonts.actor(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\u{20B9}${userDetails["winning"]}',
                              style: TextStyle(fontSize: Get.width * 0.055, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cash Bonus',
                              style: GoogleFonts.actor(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\u{20B9}${userDetails["bonus"]}',
                              style: TextStyle(fontSize: Get.width * 0.055, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Get.to(const TransactionScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Transactions',
                            style: GoogleFonts.actor(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.white,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const ReferEarnScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Refer & Earn',
                            style: GoogleFonts.actor(fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

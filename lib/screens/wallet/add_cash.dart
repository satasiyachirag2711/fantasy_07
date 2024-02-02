import 'package:fantasy_07/controller/wallet_controller.dart';
import 'package:fantasy_07/services/internet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCashScreen extends StatefulWidget {
  const AddCashScreen({super.key});

  @override
  State<AddCashScreen> createState() => _AddCashScreenState();
}

class _AddCashScreenState extends State<AddCashScreen> {
  final wallet = Get.put(WalletController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      height: Get.height * 0.67,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Cash",
                    style: GoogleFonts.actor(
                        letterSpacing: 2,
                        fontSize: Get.width * 0.065,
                        fontWeight: FontWeight.bold),
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Deposited',
                                style: GoogleFonts.actor(
                                    fontSize: Get.width * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\u{20B9}${userDetails["deposit"]}',
                                style: TextStyle(
                                    fontSize: Get.width * 0.05,
                                    fontWeight: FontWeight.bold),
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
                                style: GoogleFonts.actor(
                                    fontSize: Get.width * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\u{20B9}${userDetails["winning"]}',
                                style: TextStyle(
                                    fontSize: Get.width * 0.05,
                                    fontWeight: FontWeight.bold),
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
                                style: GoogleFonts.actor(
                                    fontSize: Get.width * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\u{20B9}${userDetails["bonus"]}',
                                style: TextStyle(
                                    fontSize: Get.width * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Enter Amount",
                    style: GoogleFonts.actor(
                        height: 3,
                        letterSpacing: 2,
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: Get.height * 0.1,
                      child: TextFormField(
                          controller: wallet.addAmount,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: const Icon(Icons.currency_rupee),
                            counter: const SizedBox(height: 0),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value) {
                            double amount = double.parse(value!);
                            if (amount <= 10) {
                              return "Amount Should Bee Greater Then 10";
                            }
                            return null;
                          }),
                    ),
                  ),
                  Text(
                    "Amount to Add",
                    style: GoogleFonts.actor(
                        height: 3,
                        letterSpacing: 2,
                        fontSize: Get.width * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          if (wallet.selectContainer.value == index) {
                            wallet.selectContainer.value = -1;
                          } else {
                            wallet.selectContainer.value = index;
                          }
                          setState(() {
                            wallet.addAmount.text = index == 0
                                ? "100"
                                : index == 1
                                    ? "200"
                                    : index == 2
                                        ? "300"
                                        : index == 3
                                            ? "500"
                                            : "1000";
                          });
                        },
                        child: Card(
                          color: wallet.selectContainer.value == index
                              ? const Color.fromARGB(255, 10, 37, 59)
                              : Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              index == 0
                                  ? "\u{20B9}100"
                                  : index == 1
                                      ? "\u{20B9}200"
                                      : index == 2
                                          ? "\u{20B9}300"
                                          : index == 3
                                              ? "\u{20B9}500"
                                              : "\u{20B9}1000",
                              style: TextStyle(
                                  color: wallet.selectContainer.value == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            wallet.addPayment();
                          });
                        }
                      },
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                              Size(Get.width, Get.height * 0.06)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green.shade900),
                          elevation: const MaterialStatePropertyAll(4),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                      child: const Text("Submit",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
          )),
    );
  }
}

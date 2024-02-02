import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../services/internet.dart';

class WalletController extends GetxController {
  TextEditingController addAmount = TextEditingController();
  TextEditingController withdrawAmount = TextEditingController();
  final selectContainer = RxInt(-1);
  // Future<void> addAmounts() async {
  //   try {
  //     final res = await EasyUpiPaymentPlatform.instance.startPayment(
  //       const EasyUpiPaymentModel(
  //         payeeVpa: 'satasiya.chirag@paytm',
  //         payeeName: 'Chirag Satasiya',
  //         transactionId: "Dvffvv",
  //         transactionRefId: "fvvf",
  //         payeeMerchantCode: "dvd",
  //         amount: 1,
  //         description: 'Fantasy 07 payment',
  //       ),
  //     );
  //     print(res!.responseCode);
  //   } catch (e) {
  //     print('Error during payment: $e');
  //   }
  // }

  Future<void> addPayment() async {
    DocumentReference userRef = FirebaseFirestore.instance.collection("userDetails").doc(FirebaseAuth.instance.currentUser!.uid);
    DocumentSnapshot userSnapshot = await userRef.get();
    int currentBalance = (userSnapshot['balance'] != null) ? userSnapshot['balance'] as int : 0;
    int currentBalancedeposit = (userSnapshot['deposit'] != null) ? userSnapshot['deposit'] as int : 0;
    int enteredAmount = int.tryParse(addAmount.text) ?? 0;
    await userRef.update({'balance': currentBalance + enteredAmount});
    await userRef.update({'deposit': currentBalancedeposit + enteredAmount});
    userData();

    String formattedDateTime = DateFormat('dd,MMMM yyyy HH:mm').format(DateTime.now());
    transactionHistory("Add Money", "Success", formattedDateTime, enteredAmount);
    Get.back();
    Get.snackbar('Success', 'Payment Add SuccessFul', backgroundColor: const Color.fromARGB(255, 194, 118, 113));
  }

  Future<void> withdrawAmounts() async {
    DocumentReference userRef = FirebaseFirestore.instance.collection("userDetails").doc(FirebaseAuth.instance.currentUser!.uid);
    DocumentSnapshot userSnapshot = await userRef.get();
    int currentBalance = (userSnapshot['balance'] != null) ? userSnapshot['balance'] as int : 0;
    int enteredAmount = int.tryParse(withdrawAmount.text) ?? 0;
    if (currentBalance > enteredAmount) {
      await userRef.update({'balance': currentBalance - enteredAmount});
      userData();
      String formattedDateTime = DateFormat('dd,MMMM yyyy HH:mm').format(DateTime.now());
      transactionHistory("WithDraw Amount", "Success", formattedDateTime, enteredAmount);
      Get.back();
      Get.snackbar('Success', 'Payment WithDraw SuccessFul', backgroundColor: const Color.fromARGB(255, 194, 118, 113));
    } else {
      Get.back();
      Get.snackbar('Cancel', 'You Have Not Valid Money', backgroundColor: const Color.fromARGB(255, 194, 118, 113));
    }
  }
}

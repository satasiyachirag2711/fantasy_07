import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fantasy_07/controller/wallet_controller.dart';
import 'package:fantasy_07/custom/custom_botombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../services/internet.dart';

class RagisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reffnumber = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  bool isPasswordVisible = false;
  final FirebaseFirestore users = FirebaseFirestore.instance;
  final Uuid uuid = const Uuid();
  int counter = 0;
  int age = 0;
  final List data = [];
  final List userdata = [];
  String store = "";
  void ragister(String emailauth, String passwordauth) async {
    // ignore: unrelated_type_equality_checks
    if (checkNetwork != ConnectivityResult.none) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailauth.toString().trim(),
          password: passwordauth.toString().trim(),
        );
        final uid = FirebaseAuth.instance.currentUser!.uid;
        String randomRefNo = uuid.v4().substring(1, 5);
        // ignore: unused_local_variable
        final wallet = Get.put(WalletController());
        await users.collection("userDetails").doc(uid).set(
          {
            "name": name.text,
            "number": number.text,
            "email": email.text,
            "password": password.text,
            "refNo.": reffnumber.text,
            "userRefNo": randomRefNo,
            "uid": uid,
            "counter": counter,
            "refUserId": userdata,
            "balance": 50,
            "aadharcard": "",
            "pancard": "",
            "bonus": 50,
            "deposit": 0,
            "winning": 0,
          },
        );
        String formattedDateTime = DateFormat('dd,MMMM yyyy HH:mm').format(DateTime.now());

        transactionHistory("Bonus", "Success", formattedDateTime, 50);

        store = uid;
        QuerySnapshot refCodeQuery = await users.collection('userDetails').where('userRefNo', isEqualTo: reffnumber.text).get();
        if (refCodeQuery.docs.isNotEmpty) {
          String userUid = refCodeQuery.docs.first.get('uid');
          debugPrint(userUid);
          counterPlus(userUid);
          refUserData(userUid);
        } else {}
        debugPrint("============================== New User Create Account Success");
        Get.offAll(() => const CustomBotomBar());
        Get.snackbar('Successfully', 'Created Account', backgroundColor: const Color.fromARGB(255, 194, 118, 113));
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', '$e', backgroundColor: const Color.fromARGB(255, 194, 118, 113));
      }
    } else {
      Get.snackbar('Error', 'No internet connection', backgroundColor: const Color.fromARGB(255, 194, 118, 113));
    }
  }

  Future<void> userid() async {
    QuerySnapshot userDocs = await users.collection("userDetails").get();
    if (userDocs.docs.isNotEmpty) {
      for (DocumentSnapshot documentSnapshot in userDocs.docs) {
        data.add(documentSnapshot.data());
        debugPrint('$data');
      }
    }
  }

  Future<void> counterPlus(useruid) async {
    await users.collection("userDetails").doc(useruid).update({
      'counter': FieldValue.increment(1),
    });
  }

  Future<void> refUserData(useruid) async {
    await users.collection("userDetails").doc(useruid).update({
      'refUserId': FieldValue.arrayUnion([store]),
    });
  }
}

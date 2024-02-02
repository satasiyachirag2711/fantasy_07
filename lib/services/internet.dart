import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

Future<ConnectivityResult> checkNetwork() async {
  var result = await Connectivity().checkConnectivity();
  return result;
}

final userDetails = RxMap<String, dynamic>({});
final userTransaction = RxList<Map<String, dynamic>>([]);
Future<void> userData() async {
  DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.uid).get();
  userDetails.value = userSnapshot.data()!;
  debugPrint('User data: $userDetails');
}

Future<void> userTransactions() async {
  try {
    QuerySnapshot<Map<String, dynamic>> transactionQuery = await FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.uid).collection("Transactions").orderBy("timestamp", descending: true).get();

    List<Map<String, dynamic>> transactionsData = transactionQuery.docs.map((doc) => doc.data()).toList();
    userTransaction.value = transactionsData;

    debugPrint('User transactions data: $userTransaction');
  } catch (e) {
    // Handle any errors that might occur during the data retrieval
    debugPrint('Error fetching transactions: $e');
  }
}

Future<void> transactionHistory(String title, String status, String subtitle, int amount) async {
  await FirebaseFirestore.instance.collection("userDetails").doc(FirebaseAuth.instance.currentUser!.uid).collection("Transactions").doc().set(
    {
      "title": title,
      "status": status,
      "subtitle": subtitle,
      "amount": amount,
      "timestamp": FieldValue.serverTimestamp(),
    },
  );
  await userTransactions();
}

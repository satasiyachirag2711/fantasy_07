import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy_07/services/internet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AadharcardScreen extends StatefulWidget {
  const AadharcardScreen({super.key});

  @override
  State<AadharcardScreen> createState() => _AadharcardScreenState();
}

class _AadharcardScreenState extends State<AadharcardScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int aadharcard = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text('Aadhaar Card Verifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.network(
                  'https://assets-global.website-files.com/64be86eaa29fa71f24b00685/64be86eaa29fa71f24b00d04_5fe09b0c6ddf8e1fcc030150_Aadhaar.png'),
              const SizedBox(height: 20),
              const Text('Enter Your Aadhaar Card Number'),
              const SizedBox(height: 20),
              TextFormField(
                maxLength: 12,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    if (value.length > 11) {
                      setState(() {
                        aadharcard = int.parse(value);
                      });
                    } else {
                      return "Enter valid Aadhaar Number";
                    }
                  } else {
                    return 'Enter Aadhaar Number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  counterText: "",
                  hintText: 'xxxx xxxx xxxx',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.only(left: 50, right: 50))),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    aadharCardUpdate();
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> aadharCardUpdate() async {
    try {
      DocumentReference userRef = FirebaseFirestore.instance
          .collection("userDetails")
          .doc(FirebaseAuth.instance.currentUser!.uid);

      await userRef.update({'aadharcard': "$aadharcard"});
      await userData();
      Get.back();
      await userData();
    } catch (e) {
      debugPrint("Error during image upload: $e");
    }
    }
}
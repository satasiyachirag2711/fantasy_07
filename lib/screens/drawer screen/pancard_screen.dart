import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy_07/services/internet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PancardScreen extends StatefulWidget {
  const PancardScreen({super.key});

  @override
  State<PancardScreen> createState() => _PancardScreenState();
}

class _PancardScreenState extends State<PancardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String pancard = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text('Verify PAN Card'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Full Name as per PAN Card',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'PAN Card No.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                TextFormField(
                  maxLength: 12,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      RegExp panCardRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');

                      if (panCardRegex.hasMatch(value)) {
                        setState(() {
                          pancard = value;
                        });
                      } else {
                        return "Enter valid PAN Number";
                      }
                    } else {
                      return 'Enter PAN Number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'PAN Card Number', counterText: '', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 16.0),
                const Text(
                  '. Full Name on PAN card and bank account',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 5),
                const Text(
                  '. It takes max 1 working day to get PAN verified',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.grey,
                        ),
                        padding: MaterialStatePropertyAll(EdgeInsets.only(left: 150, right: 150)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        panCardUpdate();
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> panCardUpdate() async {
    try {
      DocumentReference userRef = FirebaseFirestore.instance.collection("userDetails").doc(FirebaseAuth.instance.currentUser!.uid);

      await userRef.update({'pancard': pancard});
      await userData();
      Get.back();
      await userData();
    } catch (e) {
      debugPrint("Error during image upload: $e");
    }
  }
}

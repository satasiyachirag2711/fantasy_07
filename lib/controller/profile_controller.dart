import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../services/internet.dart';

class ProfileController extends GetxController {
  final users = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  RxBool isLoaded = false.obs;
  FirebaseStorage storage = FirebaseStorage.instance;
  String imageUrl = "";

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        isLoaded.value = true;
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference = FirebaseStorage.instance.ref();
        Reference referenceDirImages = reference.child("images");
        Reference imageUpload = referenceDirImages.child(fileName);
        await imageUpload.putFile(File(image.path));
        imageUrl = await imageUpload.getDownloadURL();
        DocumentReference userRef = FirebaseFirestore.instance.collection("userDetails").doc(user!.uid);
        await userRef.update({'imageUrl': imageUrl});
        await userData();
        isLoaded.value = false;
        debugPrint(imageUrl);
      }
    } catch (e) {
      debugPrint("Error during image upload: $e");
    }
  }

  // Edit Screen
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> editAccount() async {
    try {
      DocumentReference userRef = FirebaseFirestore.instance.collection("userDetails").doc(user!.uid);
      await userRef.update({'name': name.text});
      await userRef.update({'email': email.text});
      await userRef.update({'number': number.text});
      // email auth reset email
      await userData();
      try {
        await FirebaseAuth.instance.currentUser!.updateEmail(email.text.trim());
      } catch (e) {
        debugPrint("Error during email update: $e");
      }
      Get.back();
      Get.snackbar("Edit Profile", "success", backgroundColor: const Color.fromARGB(255, 194, 118, 113));
    } catch (e) {
      debugPrint("Error during image upload: $e");
    }
  }
}

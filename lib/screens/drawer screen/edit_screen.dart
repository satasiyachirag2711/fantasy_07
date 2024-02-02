import 'package:fantasy_07/controller/profile_controller.dart';
import 'package:fantasy_07/custom/textfield_custom.dart';
import 'package:fantasy_07/services/internet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final profileController = Get.put(ProfileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    profileController.name.text = userDetails['name'];
    profileController.email.text = userDetails['email'];
    profileController.number.text = userDetails['number'];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Obx(() {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.143,
                      width: Get.width * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Get.width),
                        child: InkWell(
                          onTap: () {
                            profileController.pickImage();
                          },
                          child: userDetails["imageUrl"] == null
                              ? Image.asset("assets/images/profile.png")
                              : profileController.isLoaded.value
                                  ? const Center(child: CircularProgressIndicator())
                                  : Image.network(
                                      userDetails["imageUrl"],
                                      fit: BoxFit.fill,
                                    ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CustomTextfield(
                        labelText: 'Name',
                        hintText: 'Name',
                        isSecure: false,
                        controller: profileController.name,
                      ),
                    ),
                    CustomTextfield(
                      labelText: 'Email',
                      hintText: 'Email',
                      isSecure: false,
                      validator: (str) {
                        if (!RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(str)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                      controller: profileController.email,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CustomTextfield(
                        textInputType: TextInputType.number,
                        labelText: 'Phone No',
                        hintText: 'Phone No',
                        isSecure: false,
                        controller: profileController.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 70),
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              profileController.editAccount();
                            }
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                          ),
                          child: const Text(
                            'Change',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

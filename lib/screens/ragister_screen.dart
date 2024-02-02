import 'package:fantasy_07/controller/register_controller.dart';
import 'package:fantasy_07/custom/textfield_custom.dart';
import 'package:fantasy_07/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RagisterScreen extends StatefulWidget {
  const RagisterScreen({super.key});

  @override
  State<RagisterScreen> createState() => _RagisterScreenState();
}

class _RagisterScreenState extends State<RagisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controller = Get.put(RagisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Register',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  CustomTextfield(
                    hintText: 'Full Name',
                    labelText: 'Full Name',
                    isSecure: false,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    controller: controller.name,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomTextfield(
                      hintText: 'Phone Number',
                      labelText: 'Phone Number',
                      textInputType: TextInputType.number,
                      isSecure: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      controller: controller.number,
                    ),
                  ),
                  CustomTextfield(
                    hintText: 'Email',
                    labelText: 'Email',
                    isSecure: false,
                    validator: (str) {
                      if (!RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(str)) {
                        return "Please enter a valid email address";
                      }
                      if (str.isEmpty) {
                        return 'Please, Enter Email ID';
                      }
                      return null;
                    },
                    controller: controller.email,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1965),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null) {
                            setState(() {
                              controller.birthdate.text = DateFormat('dd MMM yyyy').format(picked);
                              DateTime selectedDate = DateFormat('dd MMM yyyy').parse(controller.birthdate.text, true);
                              Duration ageDifference = DateTime.now().difference(selectedDate);
                              controller.age = (ageDifference.inDays / 365).floor();
                              debugPrint('${controller.age}');
                            });
                          }
                        },
                        child: CustomTextfield(
                          enable: false,
                          hintText: 'Date of Birth',
                          labelText: 'Date of Birth',
                          isSecure: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Date of Birth';
                            } else if (controller.age < 18) {
                              return 'You must be at least 18 years old.';
                            }
                            return null;
                          },
                          controller: controller.birthdate,
                        ),
                      )),
                  CustomTextfield(
                    suffixIcon: IconButton(
                      icon: Icon(controller.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          controller.isPasswordVisible = !controller.isPasswordVisible;
                        });
                      },
                    ),
                    hintText: 'Password',
                    labelText: 'Password',
                    isSecure: controller.isPasswordVisible,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    controller: controller.password,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomTextfield(
                      hintText: 'Ref Number',
                      labelText: 'Ref Number',
                      isSecure: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      controller: controller.reffnumber,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      width: Get.width * 0.9,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.ragister(controller.email.text, controller.password.text);
                          }
                        },
                        child: Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.04,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Log in',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.off(() => const LoginScreen());
                              controller.name.clear();
                              controller.email.clear();
                              controller.number.clear();
                              controller.password.clear();
                              controller.reffnumber.clear();
                              controller.birthdate.clear();
                            },
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ])),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

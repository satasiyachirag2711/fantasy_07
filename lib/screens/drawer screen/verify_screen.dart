import 'package:fantasy_07/screens/drawer%20screen/aadharcard_screen.dart';
import 'package:fantasy_07/screens/drawer%20screen/pancard_screen.dart';
import 'package:fantasy_07/services/internet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final List<Map<String, dynamic>> links = [
    {'icon': Icons.mobile_friendly, 'title': 'Mobile Number'},
    {'icon': Icons.email_outlined, 'title': 'Email'},
    {'icon': Icons.contact_mail_rounded, 'title': 'Aadhaar Number'},
    {'icon': Icons.contact_mail_rounded, 'title': 'PAN Card'},
  ];

  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userDetails();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text('Verify Account'),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/verify.jpg'),
          const SizedBox(height: 20),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              String subtitleText = index == 0
                  ? userDetails["number"] ?? ""
                  : index == 1
                      ? userDetails["email"] ?? ""
                      : "";

              if (index == 2 && (userDetails["aadharcard"] ?? "").isNotEmpty) {
                subtitleText = userDetails["aadharcard"] ?? "";
              } else if (index == 3 && (userDetails["pancard"] ?? "").isNotEmpty) {
                subtitleText = userDetails["pancard"] ?? "";
              }

              return ListTile(
                leading: Icon(links[index]['icon']),
                title: Text(links[index]['title']),
                subtitle: Text(subtitleText),
                trailing: ElevatedButton(
                  onPressed: () {
                    if (index == 2 && (userDetails["aadharcard"] ?? "").isEmpty) {
                      Get.to(() => const AadharcardScreen());
                    } else if (index == 3 && (userDetails["pancard"] ?? "").isEmpty) {
                      Get.to(() => const PancardScreen());
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      index == 0 || index == 1
                          ? Colors.grey
                          : index == 2 && (userDetails["aadharcard"] ?? "").isNotEmpty
                              ? Colors.grey
                              : index == 3 && (userDetails["pancard"] ?? "").isNotEmpty
                                  ? Colors.grey
                                  : Colors.red,
                    ),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: index == 0 || index == 1
                          ? Colors.yellow
                          : index == 2 && (userDetails["aadharcard"] ?? "").isNotEmpty
                              ? Colors.yellow
                              : index == 3 && (userDetails["pancard"] ?? "").isNotEmpty
                                  ? Colors.yellow
                                  : Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

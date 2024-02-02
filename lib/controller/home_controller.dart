import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/api_services.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    loadUpcoming();
    super.onInit();
  }

  RxList<dynamic> upcomingMatch = <dynamic>[].obs;
  Future<void> loadUpcoming() async {
    try {
      await upComingMatchApi(upcomingMatch);
    } catch (error) {
      // Handle error if needed
      debugPrint('Error fetching upcoming matches: $error');
    }
  }

  final index = RxInt(0);
  RxList<Map> drList = [
    {'icon': Icons.wallet, 'Text': 'My Balance'},
    {'icon': Icons.clean_hands_rounded, 'Text': 'Refer & Earn'},
    {'icon': Icons.person_pin, 'Text': 'Verify Account'},
    {'icon': Icons.phonelink_outlined, 'Text': 'How to Play/Point System'},
    {'icon': Icons.link_sharp, 'Text': 'Useful Links'},
    {'icon': Icons.help_outline_sharp, 'Text': 'Help & Support'},
  ].obs;
}

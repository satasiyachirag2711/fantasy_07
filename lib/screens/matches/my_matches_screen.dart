import 'package:flutter/material.dart';

import '../../custom/custom_complate_match.dart';
import '../../custom/custom_live_match.dart';
import '../../custom/custom_upcoming_match.dart';

class MyMatchesScreen extends StatefulWidget {
  const MyMatchesScreen({super.key});

  @override
  State<MyMatchesScreen> createState() => _MyMatchesScreenState();
}

class _MyMatchesScreenState extends State<MyMatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              height: 30,
              child: Text('Upcoming'),
            ),
            Tab(
              height: 30,
              child: Text('Live'),
            ),
            Tab(
              height: 30,
              child: Text('Completed'),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: TabBarView(children: [
            CustomUpComingMatch(),
            CustomLiveMatch(),
            CustomCompleteMatch(),
          ]),
        ),
      ),
    );
  }
}

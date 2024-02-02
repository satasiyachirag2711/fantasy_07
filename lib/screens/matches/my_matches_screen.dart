import 'package:flutter/material.dart';

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
            appBar: const TabBar(
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
            body: TabBarView(children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('You have joined any upcoming contest'),
                    const SizedBox(height: 20),
                    const Text('join contest for any of the upcoming matches'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 15, 139, 19),
                          ),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))))),
                      child: const Text(
                        'VIEW UPCOMING MATCHES',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('Live'),
              ),
              const Center(
                child: Text('Completed'),
              ),
            ]),
            ),
        );
    }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasy_07/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/internet.dart';
import '../drawer screen/aadharcard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  List<String> images = [
    "https://i3.wp.com/static.tnn.in/thumb/msid-106322336,thumbsize-76360,width-1280,height-720,resizemode-75/106322336.jpg?strip=all",
    'https://ghbc.edu.in/college/menu/wp-content/uploads/2023/10/live-today-cricket-match_752bcd0de.jpg',
    'https://resize.indiatvnews.com/en/resize/newbucket/400_-/2020/12/1st-t20-1607074183.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CarouselSlider(
            options: CarouselOptions(
              height: Get.height * 0.20,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Image.network(
                      i,
                      width: Get.width,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
            carouselController: CarouselController(),
          ),
          Obx(
            () => (userDetails["aadharcard"] ?? "").isEmpty
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      tileColor: Colors.green,
                      leading: Image.asset('assets/images/aadhaar_Logo.png',
                          height: 30),
                      title: const Text(
                        'Verify Your Aadhaar!',
                        style: TextStyle(fontSize: 13),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const AadharcardScreen());
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Upcoming Matches',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: Get.height * 0.57,
                child: ListView.builder(
                  itemCount: homeController.upcomingMatch.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            "${homeController.upcomingMatch[index]["seriesAdWrapper"]["seriesName"]}",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${homeController.upcomingMatch[index]["seriesAdWrapper"]["matches"][0]["matchInfo"]["team1"]["teamSName"]}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${homeController.upcomingMatch[index]["seriesAdWrapper"]["matches"][0]["matchInfo"]["team2"]["teamSName"]}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '6h : 23m',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ])));
  }
}
